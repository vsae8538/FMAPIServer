package tw.almor.im.server.http.servlet;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;
import tw.almor.im.server.utils.StringUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LoggableDispatcherServlet extends DispatcherServlet {

    private static final Logger logger = LoggerFactory.getLogger("LoggableDispatcherServlet");

    private static final ObjectMapper mapper = new ObjectMapper();

    private List<String> requestUris;

    @Override
    protected void doDispatch(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ContentCachingRequestWrapper requestWrapper = new ContentCachingRequestWrapper(request);
        ContentCachingResponseWrapper responseWrapper = new ContentCachingResponseWrapper(response);

        String contentType = StringUtil.isEmpty(requestWrapper.getContentType()) ? StringUtils.EMPTY : requestWrapper.getContentType();
        String queryString = StringUtil.isEmpty(requestWrapper.getQueryString()) ? StringUtils.EMPTY : "?" + requestWrapper.getQueryString();

        String requestURI = requestWrapper.getRequestURI();

        if (requestUris == null) {
            requestUris = Arrays.asList("/actuator/**", "/favicon.ico");
        }

        AntPathMatcher matcher = new AntPathMatcher();
        for (String uri : requestUris) {
            if (matcher.match(uri, requestURI)) {
                return;
            }
        }

        Map<String, String[]> parameters = requestWrapper.getParameterMap();

        if (StringUtil.isEmpty(queryString) && !CollectionUtils.isEmpty(parameters)) {
            queryString = formatQueryParams(parameters);
        }

        String requestInfo = String.format("%s [ %s : %s : %s ], User-Agent : %s",
                requestURI + queryString,
                requestWrapper.getMethod(),
                contentType,
                requestWrapper.getRemoteAddr(),
                request.getHeader("User-Agent"));

        //創建一個 json 對象，用來存放 http 日誌
        ObjectNode rootNode = mapper.createObjectNode();

        try {
            super.doDispatch(requestWrapper, responseWrapper);
        } finally {

            boolean isApplicationJSON = contentType.contains(MediaType.APPLICATION_JSON_VALUE);

            if (isApplicationJSON) {
                JsonNode newNode = mapper.readTree(requestWrapper.getContentAsByteArray());
                rootNode.set("request body", newNode);
            }

            rootNode.put("status", responseWrapper.getStatus());
            JsonNode newNode = mapper.readTree(responseWrapper.getContentAsByteArray());
            rootNode.set("response", newNode);

            responseWrapper.copyBodyToResponse();

            logger.info(requestInfo + ", Request and Response Content : " + rootNode.toString());
        }
    }

    private Map<String, Object> getRequestHeaders(HttpServletRequest request) {
        Map<String, Object> headers = new HashMap<>();
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            headers.put(headerName, request.getHeader(headerName));
        }
        return headers;

    }

    private Map<String, Object> getResponsetHeaders(ContentCachingResponseWrapper response) {
        Map<String, Object> headers = new HashMap<>();
        Collection<String> headerNames = response.getHeaderNames();
        for (String headerName : headerNames) {
            headers.put(headerName, response.getHeader(headerName));
        }
        return headers;
    }

    protected String formatQueryParams(Map<String, String[]> params) {
        return params.entrySet().stream()
                .map(p -> {
                    try {
                        return p.getKey() + "=" + (URLEncoder.encode(p.getValue()[0], "UTF-8")).replace("+", "%20");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    return StringUtils.EMPTY;
                })
                .reduce((p1, p2) -> p1 + "&" + p2)
                .map(s -> "?" + s)
                .orElse("");
    }
}