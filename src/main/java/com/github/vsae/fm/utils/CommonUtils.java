package com.github.vsae.fm.utils;

import cn.hutool.crypto.SecureUtil;
import com.alibaba.fastjson.JSONObject;


import com.github.vsae.fm.constants.Constants;
import com.github.vsae.fm.exception.FMException;
import org.apache.commons.lang3.StringUtils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.security.Security;
import java.text.NumberFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 通用工具類

 */
public class CommonUtils {

    public static String encryptPassword(String pwd, String key){
        try {
            Security.addProvider(new com.sun.crypto.provider.SunJCE());
            Key _key = getDESSercretKey(key);
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.ENCRYPT_MODE, _key);
            byte[] data = pwd.getBytes(StandardCharsets.UTF_8);
            byte[] result = cipher.doFinal(data);
            return new sun.misc.BASE64Encoder().encode(result);
        }catch (Exception e){
            throw new FMException("密碼處理異常");
        }
    }

    /**
     * 解密密碼
     */
    public static String decryptPassowrd(String pwd, String key)
            throws Exception {
        Security.addProvider(new com.sun.crypto.provider.SunJCE());
        Key aKey = getDESSercretKey(key);
        Cipher cipher = Cipher.getInstance("DES");
        cipher.init(Cipher.DECRYPT_MODE, aKey);

        byte[] data = new sun.misc.BASE64Decoder().decodeBuffer(pwd);
        byte[] result = cipher.doFinal(data);

        return new String(result, StandardCharsets.UTF_8);
    }

    /**
     * 獲得DES加密秘鑰
     * @param key
     * @return
     * @throws UnsupportedEncodingException
     */
    public static SecretKey getDESSercretKey(String key) throws UnsupportedEncodingException {
        byte[] result = new byte[8];
        byte[] keys = null;
        keys = key.getBytes(StandardCharsets.UTF_8);
        for(int i = 0; i<8;i++){
            if(i < keys.length){
                result[i] = keys[i];
            }else{
                result[i] = 0x01;
            }
        }
        return new SecretKeySpec(result, "DES");
    }

    /**
     * 對象轉map
     * @param object 對象
     * 
     * 
     * @return Map
     */
    public static Map objectToMap(Object object){
        return JSONObject.parseObject(JSONObject.toJSONString(object), Map.class);
    }

    public static Map StringToMap(String strValue){
        return JSONObject.parseObject(strValue, HashMap.class);
    }

    /**
     * map轉對象
     * @param map map
     * @param clz 對象
     *
     * 
     * @return Map
     */
    public static <T> T mapToObj(HashMap<String,Object> map, Class<T> clz){
        if (map == null) return null;
        return JSONObject.parseObject(JSONObject.toJSONString(map), clz);
    }

    /**
     * map轉對象
     * @param map map
     * @param clz 對象
     *
     * 
     * @return Map
     */
    public static <T> T mapStringToObj(HashMap<String,String> map, Class<T> clz){
        if (map == null) return null;
        return JSONObject.parseObject(JSONObject.toJSONString(map), clz);
    }


    /**
     * 密碼工具
     * @param args String[] 字符串數組
     */
    public static void main(String[] args) throws Exception {
//        System.out.println(encryptPassword("123456", "admin"));
        System.out.println(decryptPassowrd("", ""));
    }

    /**
     * map合併
     * @param map 對象
     *
     * 
     * @return Object
     */
    public static Map<String, Object> mergeMap(Map<String, Object> map, Map<String, Object> map1){
        HashMap<String, Object> map2 = new HashMap<>();
        map2.putAll(map);
        map2.putAll(map1);
        return map2;
    }

    /**
     * 字符串分割，轉化為數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<Integer>
     */
    public static List<Integer> stringToArray(String str){
        return stringToArrayByRegex(str, ",");
    }

    /**
     * 字符串分割，轉化為數組
     * @param str 字符串
     * @param regex 分隔符有
     *
     * @since 2020-04-22
     * @return List<Integer>
     */
    public static List<Integer> stringToArrayByRegex(String str, String regex ){
        List<Integer> list = new ArrayList<>();
        if (str.contains(regex)){

            String[] split = str.split(regex);

            for (String value : split) {
                if(!StringUtils.isBlank(value)){
                    list.add(Integer.parseInt(value.trim()));
                }
            }
        }else {
            list.add(Integer.parseInt(str));
        }
        return list;
    }


    /**
     * 字符串分割，轉化為數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<String>
     */
    public static List<String> stringToArrayStr(String str){
        return stringToArrayStrRegex(str, ",");
    }

    /**
     * 數字字符數據轉int格式數據
     * @param str 待轉換的數字字符串
     * @return int數組
     */
    public static List<Integer> stringToArrayInt(String str){
        List<String> strings = stringToArrayStrRegex(str, ",");
        List<Integer> ids = new ArrayList<>();
        for (String string : strings) {
            ids.add(Integer.parseInt(string.trim()));
        }
        return ids;
    }

    /**
     * 字符串分割，轉化為數組
     * @param str 字符串
     * @param regex 分隔符有
     *
     * @since 2020-04-22
     * @return List<String>
     */
    public static List<String> stringToArrayStrRegex(String str, String regex ){
        List<String> list = new ArrayList<>();
        if (str.contains(regex)){

            String[] split = str.split(regex);

            for (String value : split) {
                if(!StringUtils.isBlank(value)){
                    list.add(value);
                }
            }
        }else {
            list.add(str);
        }
        return list;
    }

    /**
     * 字符串分割，轉化為數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<Object>
     */
    public static List<Object> stringToArrayObject(String str){
        return stringToArrayObjectRegex(str, ",");
    }

    /**
     * 字符串分割，轉化為數組
     * @param str 字符串
     * @param regex 分隔符有
     *
     * @since 2020-04-22
     * @return List<Object>
     */
    public static List<Object> stringToArrayObjectRegex(String str, String regex ){
        List<Object> list = new ArrayList<>();
        if (str.contains(regex)){

            String[] split = str.split(regex);

            for (String value : split) {
                if(!StringUtils.isBlank(value)){
                    list.add(value);
                }
            }
        }else {
            list.add(str);
        }
        return list;
    }

    /**
     * json字符串轉數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<String>
     */
    public static List<String> jsonToListString(String str){
        try{
            return JSONObject.parseArray(str).toJavaList(String.class);
        }catch (Exception e){
            ArrayList<String> list = new ArrayList<>();
            list.add(str);
            return list;
        }
    }

    /**
     * json字符串轉數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<Integer>
     */
    public static List<Integer> jsonToListInteger(String str){
        try{
            return JSONObject.parseArray(str).toJavaList(Integer.class);
        }catch (Exception e){
            ArrayList<Integer> list = new ArrayList<>();
            list.add(Integer.parseInt(str));
            return list;
        }
    }

    /**
     * json字符串轉數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<Integer>
     */
    public static List<Object> jsonToListObject(String str){
        try{
            return JSONObject.parseArray(str).toJavaList(Object.class);
        }catch (Exception e){
            ArrayList<Object> list = new ArrayList<>();
            list.add(str);
            return list;
        }
    }

    /**
     * json字符串轉數組
     * @param str 字符串
     *
     * @since 2020-04-22
     * @return List<T>
     */
    public static <T> List<T> jsonToListClass(String str, Class<T> cls){
        try{
            return JSONObject.parseArray(str, cls);
        }catch (Exception e){
            return new ArrayList<>();
        }
    }

    /**
     * 去掉域名 https / http / www 信息
     * @param domain 域名
     *
     * @since 2020-04-22
     * @return String
     */
    public static String getCleanLowerDomain(String domain){
        domain = domain.toLowerCase();
        domain = domain.replaceAll("http://", "");
        domain = domain.replaceAll("https://", "");
        domain = domain.replaceAll("www.", "");
        domain = domain.replaceAll("/", "");
        return domain;
    }

    /**
     * 獲取根域名
     * @param domain 域名
     *
     * @since 2020-04-22
     * @return String
     */
    public static String getBaseLowerDomain(String domain){
        if(!domain.contains(".")){
            domain  += ".com";
        }
        domain = getCleanLowerDomain(domain);
        String[] split = domain.split("\\.");
        int len = split.length;
        if(len == 0){
            return domain;
        }
        return split[len - 2] + "." + split[len - 1];
    }

    /**
     * 獲取客戶端ip
     * @param request 參數
     *
     * @since 2020-04-22
     * @return String
     */
    public static String getClientIp(HttpServletRequest request){
        String ip = request.getHeader("X-Forwarded-For");
        if(checkIsIp(ip)){
            return ip;
        }

        ip = request.getHeader("X-Real-IP");
        if(checkIsIp(ip)){
            return ip;
        }

        ip = request.getRemoteAddr();
        if(ip.equals("0:0:0:0:0:0:0:1")){
            //本地 localhost訪問 ipv6
            ip = "127.0.0.1";
        }
        if(checkIsIp(ip)){
            return ip;
        }

        return "";
    }

    /**
     * 檢測是否為ip
     * @param ip 參數
     *
     * @since 2020-04-22
     * @return String
     */
    public static boolean checkIsIp(String ip){
        if(StringUtils.isBlank(ip)){
            return false;
        }

        if(ip.equals("unKnown")){
            return false;
        }

        if(ip.equals("unknown")){
            return false;
        }

        return ip.split("\\.").length == 4;
    }

    /**
     * 獲取fin_in_set拼裝sql
     * @param field String 字段
     * @param value Integer 值
     *
     * @since 2020-04-22
     * @return String
     */
    public static String getFindInSetSql(String field, Integer value ){
        return "find_in_set(" + value +", " + field + ")";
    }

    /**
     * 獲取fin_in_set拼裝sql
     * @param field String 字段
     * @param list ArrayList<Integer> 值
     *
     * @since 2020-04-22
     * @return String
     */
    public static String getFindInSetSql(String field, ArrayList<Integer> list ){
        ArrayList<String> sqlList = new ArrayList<>();
        for (Integer value: list) {
            sqlList.add(getFindInSetSql(field, value));
        }
        return "( " + StringUtils.join(sqlList, " or ") + ")";
    }

    /**
     * 獲取fin_in_set拼裝sql
     * @param field String 字段
     * @param idStr String 多個值，逗號分割
     *
     * @since 2020-04-22
     * @return String
     */
    public static String getFindInSetSql(String field, String idStr ){
        List<Integer> list = stringToArray(idStr);
        ArrayList<String> sqlList = new ArrayList<>();
        for (Integer value: list) {
            sqlList.add(getFindInSetSql(field, value));
        }
        return "( " + StringUtils.join(sqlList, " or ") + ")";
    }

    /**
     * 通過id獲取分類名稱
     * @param list 分類集合
     * @param categoryIdStr id字符串
     *
     * @since 2020-05-06
     * @
     */
    public static String getValueByIndex(HashMap<Integer, String> list, String categoryIdStr){
        if(list.size() < 1 || StringUtils.isBlank(categoryIdStr)){
            return "";
        }
        ArrayList<String> name = new ArrayList<>();
        List<Integer> idList = CommonUtils.stringToArray(categoryIdStr);

        String str = "";
        for (Integer id : idList) {
            str = getStrValueByIndex(list, id);
            if(!StringUtils.isBlank(str)){
                name.add(getStrValueByIndex(list, id));
            }
        }
        if(name.size() < 1){
            return "";
        }
        return StringUtils.join(name, ",");
    }

    /**
     * 通過id獲取分類名稱
     * @param list 分類集合
     * @param key id
     *
     * @since 2020-05-06
     * @
     */
    public static String getStrValueByIndex(HashMap<Integer, String> list, Integer key){
        if(list.size() < 1){
            return "";
        }
        return list.getOrDefault(key, "");
    }

    /**
     * 通過id獲取分類名稱
     * @param list 分類集合
     * @param key id
     *
     * @since 2020-05-06
     * @
     */
    public static Integer getIntValueByIndex(HashMap<Integer, Integer> list, Integer key){
        if(null == list ||list.size() < 1){
            return 0;
        }
        return list.getOrDefault(key, 0);
    }

    /**
     * 獲取uuid
     *
     * @since 2020-05-06
     * @
     */
    public static String getUuid(){
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 同比率計算 //同比增長率= ((當前週期 - 上一個週期) ÷ 上一個週期 ) *100%
     * @param i1 當前週期
     * @param i2 上一個週期
     *
     * @since 2020-05-06
     * @
     */
    public static int getRate(Integer i1, Integer i2){
        BigDecimal b1 = new BigDecimal(i1);
        BigDecimal b2 = new BigDecimal(i2);
        return getRate(b1, b2);
    }

    /**
     * 同比率計算 //同比增長率= ((當前週期 - 上一個週期) ÷ 上一個週期 ) *100%
     * @param b1 當前週期
     * @param b2 上一個週期
     *
     * @since 2020-05-06
     * @
     */
    public static int getRate(BigDecimal b1, BigDecimal b2){
        //計算差值

        if(b2.equals(b1)){
            //數值一樣，說明沒有增長
            return Constants.NUM_ZERO;
        }

        if(b2.equals(BigDecimal.ZERO)){
            //b2是0
            return Constants.NUM_ONE_HUNDRED;
        }

        return (b1.subtract(b2)).divide(b2, 2, BigDecimal.ROUND_UP).multiply(BigDecimal.TEN).multiply(BigDecimal.TEN).intValue();


//        BigDecimal.setScale();//用於格式化小數點
//        setScale(1);//表示保留以為小數，默認用四捨五入方式
//        setScale(1,BigDecimal.ROUND_DOWN);//直接刪除多餘的小數位，如2.35會變成2.3
//        setScale(1,BigDecimal.ROUND_UP);//進位處理，2.35變成2.4
//        setScale(1,BigDecimal.ROUND_HALF_UP);//四捨五入，2.35變成2.4
//        setScaler(1,BigDecimal.ROUND_HALF_DOWN);//四捨五入，2.35變成2.3，如果是5則向下舍
    }

    /**
     * 同比率計算 //同比增長率= ((當前週期 - 上一個週期) ÷ 上一個週期 ) *100%
     * @param i1 當前週期
     * @param i2 上一個週期
     *
     * @since 2020-05-06
     * @
     */
    public static BigDecimal getRateBig(Integer i1, Integer i2){
        BigDecimal b1 = new BigDecimal(i1);
        BigDecimal b2 = new BigDecimal(i2);
        return getRateBig(b1, b2);
    }

    /**
     * 同比率計算 //同比增長率= ((當前週期 - 上一個週期) ÷ 上一個週期 ) *100%
     * 如果上個週期為0， = 當前週期 * 100%
     * @param b1 當前週期
     * @param b2 上一個週期
     *
     * @since 2020-05-06
     * @
     */
    public static BigDecimal getRateBig(BigDecimal b1, BigDecimal b2){
        //計算差值

        if(b2.compareTo(b1) == 0){
            //數值一樣，說明沒有增長
            return BigDecimal.ZERO;
        }

        if(b2.compareTo(BigDecimal.ZERO) == 0){
            //b2是0
            return b1.setScale(2, BigDecimal.ROUND_UP);
        }

        return (b1.subtract(b2)).multiply(BigDecimal.TEN).multiply(BigDecimal.TEN).divide(b2, BigDecimal.ROUND_UP);
    }

    /**
     * hash 轉換
     * @param hash final byte[] hash參數
     *
     *
     * @return String
     */
    public static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash) {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    /**
     * hash 轉換
     * @param base64 String 圖片流
     *
     *
     * @return String
     */
    public static String getBase64Image(String base64) {
        return "data:image/png;base64," + base64;
    }

    /**
     * 去掉字符串第一位和最後一位
     * @param param String 參數
     * @return String
     */
    public static String trimSingeQua(String param){
        return param.substring(1,param.length()-1);
    }


    /**
     * 根據長度生成隨機數字
     * @param start 起始數字
     * @param end 結束數字
     * @return 生成的隨機碼
     */
    public static Integer randomCount(Integer start, Integer end){
        return (int)(Math.random()*(end - start +1) + start);
    }

    /**
     * 訂單號生成
     * @param payType String 支付類型
     * @return 生成的隨機碼
     */
    public static String getOrderNo(String payType){
        return payType + System.currentTimeMillis() + randomCount(11111, 99999);
    }

    /**
     * 訂單號生成
     * @param payType String 支付類型
     * @return 生成的隨機碼
     */
    public static String getOrderNoPrefix(String payType){
        switch (payType){
            case Constants.PAY_TYPE_WE_CHAT:
                return Constants.ORDER_NO_PREFIX_WE_CHAT;
            //其他平台
            default:
                return Constants.ORDER_NO_PREFIX_H5;
        }
    }

    /**
     * map排序
     * @param map Map<String, Object> 支付類型
     * @return 生成的隨機碼
     */
    public static Map<String, Object> mapSort(Map<String, Object> map) {
        return new TreeMap<>(map);
    }

    /**
     * map排序然後按照url模式拼接
     * @param map Map<String, Object> 支付類型
     * @return 生成的隨機碼
     */
    public static String mapToStringUrl(Map<String, Object> map){
        map = CommonUtils.mapSort(map);
        StringBuilder sb = new StringBuilder();       // 多線程訪問的情況下需要用StringBuffer
        Set es = map.keySet();                 // 所有參與傳參的key按照accsii排序（升序）
        for (Object set : es) {
            String k = set.toString();
            Object v = map.get(k);
            sb.append(k).append("=").append(v.toString()).append("&");
        }
        String str = sb.toString();
        return str.substring(0, str.length() - 1);
    }

    public static BigDecimal getBigDecimalRate(String rate) {
        return new BigDecimal(rate).divide(BigDecimal.TEN.multiply(BigDecimal.TEN));
    }

    /**
     * unicode編碼轉換為漢字
     * @param unicodeStr 待轉化的編碼
     * @return 返回轉化後的漢子
     */
    public static String UnicodeToCN(String unicodeStr) {
        Pattern pattern = Pattern.compile("(\\\\u(\\p{XDigit}{4}))");
        Matcher matcher = pattern.matcher(unicodeStr);
        char ch;
        while (matcher.find()) {
            //group
            String group = matcher.group(2);
            //ch:'李四'
            ch = (char) Integer.parseInt(group, 16);
            //group1
            String group1 = matcher.group(1);
            unicodeStr = unicodeStr.replace(group1, ch + "");
        }

        return unicodeStr.replace("\\", "").trim();
    }

    /**
     * 漢字轉化為Unicode編碼
     * @param CN 待轉化的中文
     * @return 返回轉化之後的unicode編碼
     */
    public static String CNToUnicode(String CN) {

        try {
            StringBuffer out = new StringBuffer("");
            //直接獲取字符串的unicode二進制
            byte[] bytes = CN.getBytes("unicode");
            //然後將其byte轉換成對應的16進制表示即可
            for (int i = 0; i < bytes.length - 1; i += 2) {
                out.append("\\u");
                String str = Integer.toHexString(bytes[i + 1] & 0xff);
                for (int j = str.length(); j < 2; j++) {
                    out.append("0");
                }
                String str1 = Integer.toHexString(bytes[i] & 0xff);
                out.append(str1);
                out.append(str);
            }
            return out.toString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getSign(Map<String, Object> map, String signKey){
        String result = CommonUtils.mapToStringUrl(map) + "&key=" + signKey;
//        return DigestUtils.md5Hex(result).toUpperCase();
        String sign = SecureUtil.md5(result).toUpperCase();
        System.out.println("sign ========== " + sign);
        return sign;
    }

    /**
     * 檢查是否可以轉換int
     * @param str
     * @return
     */
    public static boolean isString2Num(String str){
        Pattern pattern = Pattern.compile("^[0-9]*$");
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }

    //數組去重
    public static List<Integer> arrayUnique(Integer[] arr){
        List<Integer> list = new ArrayList<>();
        for (Integer integer : arr) {
            if (!list.contains(integer)) {
                list.add(integer);
            }
        }

        return list;
    }


    /**
     * 百分比計算
     * @param detailTotalNumber  銷售量
     * @param totalNumber  限量庫存
     * @return  百分比
     */
    public static String percentInstance(Integer detailTotalNumber, Integer totalNumber) {
        Double bfTotalNumber = Double.valueOf(detailTotalNumber);
        Double zcTotalNumber = Double.valueOf(totalNumber);
        double percent = bfTotalNumber/zcTotalNumber;
        //獲取格式化對象
        NumberFormat nt = NumberFormat.getPercentInstance();
        //設置百分數精確度2即保留兩位小數
        nt.setMinimumFractionDigits(2);
        return nt.format(percent);
    }

    /**
     * 百分比計算
     * @param detailTotalNumber  銷售量
     * @param totalNumber  限量庫存
     * @return  百分比
     */
    public static int percentInstanceIntVal(Integer detailTotalNumber, Integer totalNumber) {
        BigDecimal sales = new BigDecimal(detailTotalNumber);
        BigDecimal total = new BigDecimal(totalNumber);
        int percentage = sales.divide(total, 2, BigDecimal.ROUND_UP).multiply(new BigDecimal(100)).intValue();
        return Math.min(percentage, 100);
    }

    /**
     * 百分比計算
     * @param detailTotalNumber  銷售量
     * @param totalNumber  限量庫存
     * @return  百分比
     */
    public static int percentInstanceIntVal(BigDecimal detailTotalNumber, BigDecimal totalNumber) {
        int percentage = detailTotalNumber.divide(totalNumber, 2, BigDecimal.ROUND_UP).multiply(new BigDecimal(100)).intValue();
        return Math.min(percentage, 100);
    }

    /**
     * Object轉List
     */
    public static <T> List<T> castList(Object obj, Class<T> clazz) {
        List<T> result = new ArrayList<>();
        if(obj instanceof List<?>) {
            for (Object o : (List<?>) obj) {
                result.add(clazz.cast(o));
            }
            return result;
        }
        return null;
    }
}
