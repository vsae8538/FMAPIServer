package com.github.vsae.fm.constants;


public class Constants {
    public static final long TOKEN_EXPRESS_MINUTES = (60 * 24); //3小時

    public static final int HTTPSTATUS_CODE_SUCCESS = 200;

    public static final int NUM_ZERO = 0;
    public static final int NUM_ONE = 1;
    public static final int NUM_TWO = 2;
    public static final int NUM_THREE = 3;
    public static final int NUM_FIVE = 5;
    public static final int NUM_SEVEN = 7;
    public static final int NUM_TEN = 10;
    public static final int NUM_ONE_HUNDRED = 100;
    //頭部 token令牌key
    public static final String HEADER_AUTHORIZATION_KEY = "Authorization";

    //驗證碼redis key前綴
    public static final String VALIDATE_REDIS_KEY_PREFIX = "validate_code_";


    public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final String DATE_FORMAT_UTC = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    public static final String DATE_FORMAT_DATE = "yyyy-MM-dd";
    public static final String DATE_FORMAT_YEAR = "yyyy";
    public static final String DATE_FORMAT_MONTH_DATE = "MM-dd";
    public static final String DATE_FORMAT_MONTH = "yyyy-MM";
    public static final String DATE_TIME_FORMAT_NUM = "yyyyMMddHHmmss";
    public static final String DATE_FORMAT_NUM = "yyyyMMdd";
    public static final String DATE_FORMAT_START = "yyyy-MM-dd 00:00:00";
    public static final String DATE_FORMAT_END = "yyyy-MM-dd 23:59:59";
    public static final String DATE_FORMAT_MONTH_START = "yyyy-MM-01 00:00:00";
    public static final String DATE_FORMAT_YEAR_START = "yyyy-01-01 00:00:00";
    public static final String DATE_FORMAT_YEAR_END = "yyyy-12-31 23:59:59";
    public static final String DATE_FORMAT_HHMMSS = "HH:mm:ss";
    public static final String DATE_FORMAT_START_PEREND = "00:00:00";
    public static final String DATE_FORMAT_END_PEREND = "23:59:59";
    public static final String DATE_FORMAT_HHMM = "yyyy-MM-dd HH:mm";

    //後台管理員操作資金mark
    public static final String USER_BILL_OPERATE_LOG_TITLE = "{$title}{$operate}了{$value}{$founds}";

    //用戶等級升級
    public static final String USER_LEVEL_OPERATE_LOG_MARK = "尊敬的用戶 【{$userName}】, 在{$date}贈送會員等級成為{$levelName}會員";
    public static final String USER_LEVEL_UP_LOG_MARK = "尊敬的用戶 【{$userName}】, 在{$date}您升級為為{$levelName}會員";


    //用戶登錄密碼加密混淆字符串
    public static final String USER_LOGIN_PASSWORD_MD5_KEYWORDS = "vsae";

    //用戶登token redis存儲前綴
    public static final String USER_TOKEN_REDIS_KEY_PREFIX = "TOKEN_USER:";


    //用戶登錄方式 h5
    public static final String USER_LOGIN_TYPE_H5 = "h5";

    //用戶登錄方式 公眾號
    public static final String USER_LOGIN_TYPE_PUBLIC = "wechat";

    //用戶登錄方式 小程序
    public static final String USER_LOGIN_TYPE_PROGRAM = "routine";

    // 用戶登錄方式 App
    public static final String USER_LOGIN_TYPE_IOS_WX = "iosWx";
    public static final String USER_LOGIN_TYPE_ANDROID_WX = "androidWx";

    // 用戶登錄方式 App
    public static final String USER_LOGIN_TYPE_IOS = "ios";


    //用戶默認頭像
    public static final String USER_DEFAULT_AVATAR_CONFIG_KEY = "h5_avatar";

    //用戶默認推廣人id
    public static final Integer USER_DEFAULT_SPREAD_ID = 0;

    //默認分頁
    public static final int DEFAULT_PAGE = 1;

    //默認分頁
    public static final int DEFAULT_LIMIT = 20;

    //升序排序
    public static final String SORT_ASC = "asc";

    //降序排序
    public static final String SORT_DESC = "desc";

    //導出最大數值
    public static final Integer EXPORT_MAX_LIMIT = 99999;

    //商品最多選擇的分類數量
    public static final Integer PRODUCT_SELECT_CATEGORY_NUM_MAX = 10;

    //上傳類型
//    public static final String UPLOAD_TYPE_IMAGE = "image";
    public static final String UPLOAD_TYPE_IMAGE = "crmebimage";

    //上傳類型
    public static final String UPLOAD_TYPE_FILE = "file";
    public static final String UPLOAD_ROOT_PATH_CONFIG_KEY = "upload_root_path";//上傳地址
    public static final String UPLOAD_MODEL_PATH_EXCEL = "excel";// excel

    //圖片上傳
    public static final String UPLOAD_IMAGE_EXT_STR_CONFIG_KEY = "image_ext_str";//圖片上傳
    public static final String UPLOAD_IMAGE_MAX_SIZE_CONFIG_KEY = "image_max_size";

    //文件上傳
    public static final String UPLOAD_FILE_EXT_STR_CONFIG_KEY = "file_ext_str";
    //最大上傳文件
    public static final String UPLOAD_FILE_MAX_SIZE_CONFIG_KEY = "file_max_size";

    public static final int UPLOAD_TYPE_USER = 7; //用戶上傳

    // 移動端文章頂部的banner圖最大數量 配置數據最小3最大10
    public static final String ARTICLE_BANNER_LIMIT = "news_slides_limit";

    //城市數據 redis key
    public static final String CITY_LIST = "city_list";
    //城市數據 tree redis key
    public static final String CITY_LIST_TREE = "city_list_tree";
    //城市數據 tree redis key
    public static final String CITY_LIST_LEVEL_1 = "city_list_level_1";

    //商品庫存變動隊列key
    public static final String PRODUCT_STOCK_UPDATE = "product_stock_update";
    // 商品秒殺庫存隊列Key
    public static final String PRODUCT_SECKILL_STOCK_UPDATE = "product_seckill_stock_update";
    // 商品砍價庫存隊列Key
    public static final String PRODUCT_BARGAIN_STOCK_UPDATE = "product_bargain_stock_update";
    // 商品拼團庫存隊列Key
    public static final String PRODUCT_COMBINATION_STOCK_UPDATE = "product_combination_stock_update";
    //商品庫存redis key
    public static final String PRODUCT_STOCK_LIST = "product_stock_list";


    //sku庫存變動隊列key
//    public static final String SKU_STOCK_UPDATE = "product_stock_update";
    //sku庫存redis key
//    public static final String SKU_STOCK_LIST = "product_stock_list";

    //消息模板隊列key
    public static final String WE_CHAT_MESSAGE_KEY_PUBLIC = "we_chat_public_message_list";
    public static final String WE_CHAT_MESSAGE_KEY_PROGRAM = "we_chat_program_message_list";
    public static final String WE_CHAT_MESSAGE_INDUSTRY_KEY = "we_chat_message_industry";

    //config表數據redis
    public static final String CONFIG_LIST = "config_list"; //配置列表


    //快遞信息緩存
    public static final String LOGISTICS_KEY = "logistics_";

    //config配置的key
    public static final String CONFIG_KEY_SITE_URL = "site_url"; //域名
    public static final String CONFIG_KEY_API_URL = "api_url"; //接口地址
    public static final String CONFIG_KEY_SITE_LOGO = "mobile_top_logo"; //logo地址
    public static final String CONFIG_KEY_MOBILE_LOGIN_LOGO = "mobile_login_logo"; // 移動端登錄 logo
    public static final String CONFIG_KEY_SITE_NAME = "site_name"; //網站名稱
    public static final String CONFIG_SITE_TENG_XUN_MAP_KEY = "tengxun_map_key"; //騰訊地圖key
    public static final String CONFIG_BANK_LIST = "user_extract_bank"; //可提現銀行
    public static final String CONFIG_EXTRACT_FREEZING_TIME = "extract_time"; //提現凍結時間
    public static final String CONFIG_EXTRACT_MIN_PRICE = "user_extract_min_price"; //提現最低金額
    public static final String CONFIG_RECHARGE_ATTENTION = "recharge_attention"; //充值注意事項

    public static final String CONFIG_KEY_PAY_WE_CHAT_APP_ID = "pay_weixin_appid"; //公眾號appId
    public static final String CONFIG_KEY_PAY_WE_CHAT_MCH_ID = "pay_weixin_mchid"; //公眾號配的商戶號
    public static final String CONFIG_KEY_PAY_WE_CHAT_APP_SECRET = "pay_weixin_appsecret"; //公眾號秘鑰
    public static final String CONFIG_KEY_PAY_WE_CHAT_APP_KEY = "pay_weixin_key"; //公眾號支付key
    public static final String CONFIG_KEY_PAY_ROUTINE_APP_ID = "pay_routine_appid"; //小程序appId
    public static final String CONFIG_KEY_PAY_ROUTINE_MCH_ID = "pay_routine_mchid"; //小程序分配的商戶號
    public static final String CONFIG_KEY_PAY_ROUTINE_APP_SECRET = "pay_routine_appsecret"; //小程序秘鑰
    public static final String CONFIG_KEY_PAY_ROUTINE_APP_KEY = "pay_routine_key"; //小程序支付key

    public static final String CONFIG_KEY_PAY_WE_CHAT_APP_APP_ID = "pay_weixin_app_appid"; //公眾號appId
    public static final String CONFIG_KEY_PAY_WE_CHAT_APP_MCH_ID = "pay_weixin_app_mchid"; //公眾號配的商戶號
    public static final String CONFIG_KEY_PAY_WE_CHAT_APP_APP_KEY = "pay_weixin_app_key"; //公眾號支付key

    public static final String CONFIG_KEY_RECHARGE_MIN_AMOUNT = "store_user_min_recharge"; //最小充值金額
//    public static final String CONFIG_KEY_PROGRAM_LOGO = "routine_logo"; //小程序logo
//    public static final String CONFIG_KEY_PUBLIC_LOGO = "wechat_avatar"; //公眾號logo

    public static final String CONFIG_KEY_LOGISTICS_APP_CODE = "system_express_app_code"; //快遞查詢密鑰

    //雲智服 小程序插件
    public static final String CONFIG_KEY_YZF_H5_URL = "yzf_h5_url"; //雲智服H5 url



    //分銷
    public static final String CONFIG_KEY_STORE_BROKERAGE_LEVEL = "store_brokerage_rate_num"; //返佣比例前綴
    public static final String CONFIG_KEY_STORE_BROKERAGE_RATE_ONE = "store_brokerage_ratio"; //一級返佣比例前綴
    public static final String CONFIG_KEY_STORE_BROKERAGE_RATE_TWO = "store_brokerage_two"; //二級返佣比例前綴
    public static final String CONFIG_KEY_STORE_BROKERAGE_USER_EXTRACT_MIN_PRICE = "user_extract_min_price"; //提現最低金額
    public static final String CONFIG_KEY_STORE_BROKERAGE_MODEL = "store_brokerage_status"; //分銷模式1-指定分銷2-人人分銷
    public static final String CONFIG_KEY_STORE_BROKERAGE_USER_EXTRACT_BANK = "user_extract_bank"; //提現銀行卡
    public static final String CONFIG_KEY_STORE_BROKERAGE_EXTRACT_TIME = "extract_time"; //佣金凍結時間
    public static final String CONFIG_KEY_STORE_INTEGRAL_EXTRACT_TIME = "freeze_integral_day"; //積分凍結時間
    public static final String CONFIG_KEY_STORE_BROKERAGE_PERSON_PRICE = "store_brokerage_price"; //人人分銷滿足金額
    public static final String CONFIG_KEY_STORE_BROKERAGE_IS_OPEN = "brokerage_func_status"; //分銷啟用
    public static final String CONFIG_KEY_STORE_BROKERAGE_BIND_TYPE = "brokerageBindind"; //分銷關係綁定0-所有游湖，2-新用戶

    //積分
    public static final String CONFIG_KEY_INTEGRAL_RATE = "integral_ratio"; //積分抵用比例(1積分抵多少金額
    public static final String CONFIG_KEY_INTEGRAL_RATE_ORDER_GIVE = "order_give_integral"; //下單支付金額按比例贈送積分（實際支付1元贈送多少積分

    //分銷
    public static final String CONFIG_KEY_DISTRIBUTION_TYPE = "brokerage_bindind";

    //驗證碼過期時間
    public static final String CONFIG_KEY_SMS_CODE_EXPIRE = "sms_code_expire";


    //config配置的formId
    public static final int CONFIG_FORM_ID_INDEX = 133; //首頁配置
    public static final int CONFIG_FORM_ID_PUBLIC = 65; //公眾號配置


    //第三方登錄token類型
    public static final int THIRD_LOGIN_TOKEN_TYPE_PUBLIC  = 1; //公眾號
    public static final int THIRD_LOGIN_TOKEN_TYPE_PROGRAM  = 2; //小程序
    public static final int THIRD_LOGIN_TOKEN_TYPE_UNION_ID  = 3; //unionid
    public static final int THIRD_ADMIN_LOGIN_TOKEN_TYPE_PUBLIC  = 4; //後台登錄公眾號
    public static final int THIRD_LOGIN_TOKEN_TYPE_IOS_WX  = 5; //ios 微信
    public static final int THIRD_LOGIN_TOKEN_TYPE_ANDROID_WX = 6; //android微信
    public static final int THIRD_LOGIN_TOKEN_TYPE_IOS  = 7; //ios


    // 商品類型 活動類型 0=商品，1=秒殺，2=砍價，3=拼團 attrResult表用到
    public static final Integer PRODUCT_TYPE_NORMAL = 0;
    public static final String PRODUCT_TYPE_NORMAL_STR = "默認";
    public static final Integer PRODUCT_TYPE_SECKILL = 1;
    public static final String PRODUCT_TYPE_SECKILL_STR = "秒殺";
    public static final Integer PRODUCT_TYPE_BARGAIN = 2;
    public static final String PRODUCT_TYPE_BARGAIN_STR = "砍價";
    public static final Integer PRODUCT_TYPE_PINGTUAN= 3;
    public static final String PRODUCT_TYPE_PINGTUAN_STR= "拼團";
    public static final Integer PRODUCT_TYPE_COMPONENT= 4;
    public static final String PRODUCT_TYPE_COMPONENT_STR= "組件";
    public static final Integer PRODUCT_TYPE_GROUP = 0;




    //group gid
    public static final Integer GROUP_DATA_ID_INDEX_BEST_BANNER = 37; //中部推薦banner圖
    public static final Integer GROUP_DATA_ID_INDEX_BANNER = 48; //首頁banner滾動圖
    public static final Integer GROUP_DATA_ID_INDEX_RECOMMEND_BANNER = 52; //首頁精品推薦Banner圖片
    public static final Integer GROUP_DATA_ID_ORDER_STATUS_PIC = 53; //訂單詳情狀態圖
    public static final Integer GROUP_DATA_ID_USER_CENTER_MENU = 54; //個人中心菜單
    public static final Integer GROUP_DATA_ID_SIGN = 55; //簽到配置
    public static final Integer GROUP_DATA_ID_HOT_SEARCH = 56; //熱門搜索
    public static final Integer GROUP_DATA_ID_INDEX_HOT_BANNER = 57; //熱門榜單推薦Banner圖片
    public static final Integer GROUP_DATA_ID_INDEX_NEW_BANNER = 58; //首發新品推薦Banner圖片
    public static final Integer GROUP_DATA_ID_INDEX_BENEFIT_BANNER = 59; //首頁促銷單品推薦Banner圖片
    public static final Integer GROUP_DATA_ID_SPREAD_BANNER_LIST = 60; //推廣海報圖
    public static final Integer GROUP_DATA_ID_RECHARGE_LIST = 62; //充值金額設置
    public static final Integer GROUP_DATA_ID_USER_CENTER_BANNER = 65; //個人中心輪播圖
    public static final Integer GROUP_DATA_ID_INDEX_MENU = 67; //導航模塊
    public static final Integer GROUP_DATA_ID_INDEX_NEWS_BANNER = 68; //首頁滾動新聞
    public static final Integer GROUP_DATA_ID_INDEX_ACTIVITY_BANNER = 69; //首頁活動區域圖片
    public static final Integer GROUP_DATA_ID_INDEX_EX_BANNER = 70; //首頁超值爆款
    public static final Integer GROUP_DATA_ID_INDEX_KEYWORDS = 71; //熱門搜索
    public static final Integer GROUP_DATA_ID_ADMIN_LOGIN_BANNER_IMAGE_LIST = 72; //後台登錄頁面輪播圖
    public static final Integer GROUP_DATA_ID_COMBINATION_LIST_BANNNER = 73; //拼團列表banner



    //簽到
    public static final Integer SIGN_TYPE_INTEGRAL = 1; //積分
    public static final Integer SIGN_TYPE_EXPERIENCE = 2; //經驗
    public static final String SIGN_TYPE_INTEGRAL_TITLE = "簽到積分獎勵"; //積分
    public static final String SIGN_TYPE_EXPERIENCE_TITLE = "簽到經驗獎勵"; //經驗


    //會員搜索日期類型
    public static final String SEARCH_DATE_DAY = "today"; //今天
    public static final String SEARCH_DATE_YESTERDAY = "yesterday"; //昨天
    public static final String SEARCH_DATE_LATELY_7 = "lately7"; //最近7天
    public static final String SEARCH_DATE_LATELY_30 = "lately30"; //最近30天
    public static final String SEARCH_DATE_WEEK = "week"; //本周
    public static final String SEARCH_DATE_PRE_WEEK = "preWeek"; //上周
    public static final String SEARCH_DATE_MONTH = "month"; //本月
    public static final String SEARCH_DATE_PRE_MONTH = "preMonth"; //上月
    public static final String SEARCH_DATE_YEAR = "year"; //年
    public static final String SEARCH_DATE_PRE_YEAR = "preYear"; //上一年

    //分類服務類型  類型，1 產品分類，2 附件分類，3 文章分類， 4 設置分類， 5 菜單分類， 6 配置分類， 7 秒殺配置
    public static final int CATEGORY_TYPE_PRODUCT = 1; //產品
    public static final int CATEGORY_TYPE_ATTACHMENT = 2; //附件分類
    public static final int CATEGORY_TYPE_ARTICLE = 3; //文章分類
    public static final int CATEGORY_TYPE_SET = 4; //設置分類
    public static final int CATEGORY_TYPE_MENU = 5; //菜單分類
    public static final int CATEGORY_TYPE_CONFIG = 6; //配置分類
    public static final int CATEGORY_TYPE_SKILL = 7; //秒殺配置

    //首頁Banner圖片
    public static final int INDEX_RECOMMEND_BANNER = 1; //首頁精品推薦Banner圖片
    public static final int INDEX_HOT_BANNER = 2; //熱門榜單推薦Banner圖片
    public static final int INDEX_NEW_BANNER = 3; //首頁首發新品推薦Banner圖片
    public static final int INDEX_BENEFIT_BANNER = 4; //首頁促銷單品推薦Banner圖片
    public static final int INDEX_LIMIT_DEFAULT = 3; //首頁默認list分頁條數
    public static final int INDEX_GOOD_BANNER = 5; //優選推薦

    public static final String INDEX_BAST_LIMIT = "bastNumber"; //精品推薦個數
    public static final String INDEX_FIRST_LIMIT = "firstNumber"; //首發新品個數
    public static final String INDEX_SALES_LIMIT = "promotionNumber"; //促銷單品個數
    public static final String INDEX_HOT_LIMIT = "hotNumber"; //熱門推薦個數


    //用戶資金
    public static final String USER_BILL_CATEGORY_MONEY = "now_money"; //用戶余額
    public static final String USER_BILL_CATEGORY_INTEGRAL = "integral"; //積分
    public static final String USER_BILL_CATEGORY_SHARE = "share"; //分享
    public static final String USER_BILL_CATEGORY_EXPERIENCE = "experience"; //經驗
    public static final String USER_BILL_CATEGORY_BROKERAGE_PRICE = "brokerage_price"; //佣金金額
    public static final String USER_BILL_CATEGORY_SIGN_NUM = "sign_num"; //簽到天數

    public static final String USER_BILL_TYPE_BROKERAGE = "brokerage"; //推廣佣金
    public static final String USER_BILL_TYPE_DEDUCTION = "deduction"; //抵扣
    public static final String USER_BILL_TYPE_EXTRACT = "extract"; //提現
    public static final String USER_BILL_TYPE_TRANSFER_IN = "transferIn"; //佣金轉入余額
    public static final String USER_BILL_TYPE_GAIN = "gain"; //購買商品贈送
    public static final String USER_BILL_TYPE_PAY_MONEY = "pay_money"; //購買
    public static final String USER_BILL_TYPE_PAY_PRODUCT = "pay_product"; //購買商品
    public static final String USER_BILL_TYPE_PAY_PRODUCT_INTEGRAL_BACK = "pay_product_integral_back"; //商品退積分
    public static final String USER_BILL_TYPE_PAY_PRODUCT_REFUND = "pay_product_refund"; //商品退款
    public static final String USER_BILL_TYPE_RECHARGE = "recharge"; //佣金轉入
    public static final String USER_BILL_TYPE_PAY_RECHARGE = "pay_recharge"; //充值
    public static final String USER_BILL_TYPE_SHARE = "share"; //用戶分享記錄
    public static final String USER_BILL_TYPE_SIGN = "sign"; //簽到
    public static final String USER_BILL_TYPE_ORDER = "order"; //訂單
    public static final String USER_BILL_TYPE_PAY_ORDER = "pay_order"; //訂單支付
    public static final String USER_BILL_TYPE_SYSTEM_ADD = "system_add"; //系統增加
    public static final String USER_BILL_TYPE_SYSTEM_SUB = "system_sub"; //系統減少
    public static final String USER_BILL_TYPE_PAY_MEMBER = "pay_member";// 會員支付
    public static final String USER_BILL_TYPE_OFFLINE_SCAN = "offline_scan";// 線下支付
    public static final String USER_BILL_TYPE_USER_RECHARGE_REFUND = "user_recharge_refund";// 用戶充值退款

    //訂單狀態
    public static final String ORDER_STATUS_ALL = "all"; //所有
    public static final String ORDER_STATUS_UNPAID = "unPaid"; //未支付
    public static final String ORDER_STATUS_NOT_SHIPPED = "notShipped"; //未發貨
    public static final String ORDER_STATUS_SPIKE = "spike"; //待收貨
    public static final String ORDER_STATUS_BARGAIN = "bargain"; //已收貨待評價
    public static final String ORDER_STATUS_COMPLETE = "complete"; //交易完成
    public static final String ORDER_STATUS_TOBE_WRITTEN_OFF = "toBeWrittenOff"; //待核銷
    public static final String ORDER_STATUS_APPLY_REFUNDING = "applyRefund"; //申請退款
    public static final String ORDER_STATUS_REFUNDING = "refunding"; //退款中
    public static final String ORDER_STATUS_REFUNDED = "refunded"; //已退款
    public static final String ORDER_STATUS_DELETED = "deleted"; //已刪除

    public static final String ORDER_STATUS_STR_UNPAID = "未支付"; //未支付
    public static final String ORDER_STATUS_STR_NOT_SHIPPED = "未發貨"; //未發貨
    public static final String ORDER_STATUS_STR_SPIKE = "待收貨"; //待收貨
    public static final String ORDER_STATUS_STR_BARGAIN = "待評價"; //已收貨待評價
    public static final String ORDER_STATUS_STR_TAKE = "用戶已收貨"; //用戶已收貨
    public static final String ORDER_STATUS_STR_COMPLETE = "交易完成"; //交易完成
    public static final String ORDER_STATUS_STR_TOBE_WRITTEN_OFF = "待核銷"; //待核銷
    public static final String ORDER_STATUS_STR_APPLY_REFUNDING = "申請退款"; //申請退款
    public static final String ORDER_STATUS_STR_REFUNDING = "退款中"; //退款中
    public static final String ORDER_STATUS_STR_REFUNDED = "已退款"; //已退款
    public static final String ORDER_STATUS_STR_DELETED = "已刪除"; //已刪除

    // H5 端訂單狀態
    public static final int ORDER_STATUS_H5_UNPAID = 0; // 未支付
    public static final int ORDER_STATUS_H5_NOT_SHIPPED = 1; // 待發貨
    public static final int ORDER_STATUS_H5_SPIKE = 2; // 待收貨
    public static final int ORDER_STATUS_H5_JUDGE = 3; // 待評價
    public static final int ORDER_STATUS_H5_COMPLETE = 4; // 已完成
    public static final int ORDER_STATUS_H5_VERIFICATION = 5; // 待核銷
    public static final int ORDER_STATUS_H5_REFUNDING = -1; // 退款中
    public static final int ORDER_STATUS_H5_REFUNDED = -2; // 已退款
    public static final int ORDER_STATUS_H5_REFUND = -3; // 退款

    public static final int ORDER_STATUS_INT_PAID = 0; //已支付
    public static final int ORDER_STATUS_INT_SPIKE = 1; //待收貨
    public static final int ORDER_STATUS_INT_BARGAIN = 2; //已收貨，待評價
    public static final int ORDER_STATUS_INT_COMPLETE = 3; //已完成


    //訂單操作redis隊列
    public static final String ORDER_TASK_REDIS_KEY_AFTER_DELETE_BY_USER = "alterOrderDeleteByUser"; // 用戶刪除訂單後續操作
    public static final String ORDER_TASK_REDIS_KEY_AFTER_COMPLETE_BY_USER = "alterOrderCompleteByUser"; // 用戶完成訂單後續操作
    public static final String ORDER_TASK_REDIS_KEY_AFTER_CANCEL_BY_USER = "alterOrderCancelByUser"; // 用戶取消訂單後續操作
    public static final String ORDER_TASK_REDIS_KEY_AFTER_REFUND_BY_USER = "alterOrderRefundByUser"; // 用戶訂單退款後續操作
    public static final String ORDER_TASK_REDIS_KEY_AFTER_TAKE_BY_USER = "alterOrderTakeByUser"; // 用戶訂單收貨後續操作
    public static final String ORDER_TASK_PAY_SUCCESS_AFTER = "orderPaySuccessTask"; // 訂單支付成功後續操作

    public static final String ORDER_STATUS_CACHE_CREATE_ORDER = "cache_key_create_order";

    //支付方式
    public static final String PAY_TYPE_WE_CHAT = "weixin"; //微信支付
    public static final String PAY_TYPE_YUE = "yue"; //余額支付
    public static final String PAY_TYPE_OFFLINE = "offline"; //線下支付
    public static final String PAY_TYPE_ALI_PAY = "alipay"; //支付寶

    //支付客戶端類型
    public static final String PAY_TYPE_WE_CHAT_FROM_H5 = "weixinh5"; //H5喚起微信支付
    public static final String PAY_TYPE_WE_CHAT_FROM_PUBLIC = "public"; //公眾號
    public static final String PAY_TYPE_WE_CHAT_FROM_PROGRAM = "routine"; //小程序

    //後台微信登錄類型
    public static final String ADMIN_LOGIN_TYPE_WE_CHAT_FROM_PUBLIC = "admin_public"; //公眾號



    //支付方式
    public static final String PAY_TYPE_STR_WE_CHAT = "微信支付"; //微信支付
    public static final String PAY_TYPE_STR_YUE = "余額支付"; //余額支付
    public static final String PAY_TYPE_STR_OFFLINE = "線下支付"; //線下支付
    public static final String PAY_TYPE_STR_ALI_PAY = "支付寶"; //支付寶
    public static final String PAY_TYPE_STR_OTHER = "其他支付"; //其他支付

    //需要支付的業務類型
    public static final String SERVICE_PAY_TYPE_ORDER = "order"; //訂單
    public static final String SERVICE_PAY_TYPE_RECHARGE = "recharge"; //充值



    //訂單操作類型
    public static final String ORDER_STATUS_STR_SPIKE_KEY = "send"; //待收貨 KEY
    public static final String ORDER_LOG_REFUND_PRICE = "refund_price"; //退款
    public static final String ORDER_LOG_EXPRESS = "express"; //快遞
    public static final String ORDER_LOG_DELIVERY = "delivery"; //送貨
    public static final String ORDER_LOG_DELIVERY_GOODS = "delivery_goods"; //送貨
    public static final String ORDER_LOG_REFUND_REFUSE = "refund_refuse"; //不退款
    public static final String ORDER_LOG_REFUND_APPLY = "apply_refund"; //
    public static final String ORDER_LOG_PAY_SUCCESS = "pay_success"; //支付成功
    public static final String ORDER_LOG_DELIVERY_VI = "delivery_fictitious"; //虛擬發貨
    public static final String ORDER_LOG_EDIT = "order_edit"; //編輯訂單
    public static final String ORDER_LOG_PAY_OFFLINE = "offline"; //線下付款訂單


    // 訂單緩存
    public static final long ORDER_CASH_CONFIRM = (60);
    public static final String ORDER_CACHE_PER = "ORDER_CACHE:"; // redis緩存訂單前綴

    //訂單操作類型 -> 消息
    public static final String ORDER_LOG_MESSAGE_REFUND_PRICE = "退款給用戶{amount}元"; //退款
    public static final String ORDER_LOG_MESSAGE_EXPRESS = "已發貨 快遞公司：{deliveryName}, 快遞單號：{deliveryCode}"; //快遞
    public static final String ORDER_LOG_MESSAGE_DELIVERY = "已配送 發貨人：{deliveryName}, 發貨人電話：{deliveryCode}"; //送貨
    public static final String ORDER_LOG_MESSAGE_DELIVERY_FICTITIOUS = "已虛擬發貨"; //已虛擬發貨
    public static final String ORDER_LOG_MESSAGE_REFUND_REFUSE = "不退款款因：{reason}"; //不退款款因
    public static final String ORDER_LOG_MESSAGE_PAY_SUCCESS = "用戶付款成功"; //用戶付款成功

    public static final String ORDER_NO_PREFIX_WE_CHAT = "wx"; //微信平台下單訂單號前綴
    public static final String ORDER_NO_PREFIX_H5 = "h5"; //微信平台下單訂單號前綴

    //支付渠道 訂單表
    public static final int ORDER_PAY_CHANNEL_PUBLIC = 0; //公眾號
    public static final int ORDER_PAY_CHANNEL_PROGRAM = 1; //小程序
    public static final int ORDER_PAY_CHANNEL_H5 = 2; //H5
    public static final int ORDER_PAY_CHANNEL_YUE = 3; //余額
    public static final int ORDER_PAY_CHANNEL_APP_IOS = 4; //app-ios
    public static final int ORDER_PAY_CHANNEL_APP_ANDROID = 5; //app-android

    //微信消息模板 tempKey
//    public static final String WE_CHAT_TEMP_KEY_FIRST = "first";
//    public static final String WE_CHAT_TEMP_KEY_END = "remark";
    // 公眾號模板消息

//    public static final String WE_CHAT_TEMP_KEY_COMBINATION_SUCCESS = "OPENTM407456411";// 拼團成功
//    public static final String WE_CHAT_TEMP_KEY_BARGAIN_SUCCESS = "OPENTM410292733";// 砍價成功
//    public static final String WE_CHAT_TEMP_KEY_EXPRESS = "OPENTM200565259";// 訂單發貨提醒
//    public static final String WE_CHAT_TEMP_KEY_DELIVERY = "OPENTM207707249";// 訂單配送通知
//    public static final String WE_CHAT_TEMP_KEY_ORDER_PAY = "OPENTM207791277";// 訂單支付成功通知
//    public static final String WE_CHAT_TEMP_KEY_ORDER_RECEIVING = "OPENTM413386489";// 訂單收貨通知
//    public static final String WE_CHAT_TEMP_KEY_ORDER_REFUND = "OPENTM207791277";// 退款進度通知
//    public static final String WE_CHAT_PUBLIC_TEMP_KEY_RECHARGE = "OPENTM200565260";// 充值成功

    // 小程序服務通知
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_COMBINATION_SUCCESS = "5164";// 拼團成功
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_BARGAIN_SUCCESS = "2920";// 砍價成功
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_EXPRESS = "467";// 訂單發貨提醒
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_DELIVERY = "14198";// 訂單配送通知
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_ORDER_PAY = "516";// 訂單支付成功通知
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_ORDER_RECEIVING = "9283";// 訂單收貨通知
    public static final String WE_CHAT_PROGRAM_TEMP_KEY_RECHARGE = "OPENTM200565260";



    //CND  URL測試用
    public static String CND_URL = "https://wuht-1300909283.cos.ap-chengdu.myqcloud.com";

    //物流  https://market.aliyun.com/products/56928004/cmapi021863.html#sku=yuncode15863000015
    public static String LOGISTICS_API_URL = "https://wuliu.market.alicloudapi.com/kdi";

    // 訂單 基本 操作字樣
    public static String RESULT_ORDER_NOTFOUND = "訂單號 ${orderCode} 未找到";
    public static String RESULT_ORDER_NOTFOUND_IN_ID = "訂單id ${orderId} 未找到";
    public static String RESULT_ORDER_PAYED = "訂單號 ${orderCode} 已支付";
    public static String RESULT_ORDER_EDIT_PRICE_SAME = "修改價格不能和支付價格相同 原價 ${oldPrice} 修改價 ${editPrice}";
    public static String RESULT_ORDER_EDIT_PRICE_SUCCESS = "訂單號 ${orderNo} 修改價格 ${price} 成功";
    public static String RESULT_ORDER_EDIT_PRICE_LOGS = "訂單價格 ${orderPrice} 修改實際支付金額為 ${price} 元";

    // 訂單 支付 操作字樣
    public static String RESULT_ORDER_PAY_OFFLINE = "訂單號 ${orderNo} 現在付款 ${price} 成功";

    // 訂單核銷 返回字樣 Order response text info
    public static String RESULT_VERIFICATION_ORDER_NOT_FUND = "核銷碼 ${vCode} 的訂單未找到";
    public static String RESULT_VERIFICATION_ORDER_VED = "核銷碼 ${vCode} 的訂單已核銷";
    public static String RESULT_VERIFICATION_NOTAUTH = "沒有核銷權限";
    public static String RESULT_VERIFICATION_USER_EXIST = "當前用戶已經是核銷員";


    // QRcode Response text info
    public static String RESULT_QRCODE_PRAMERROR = "生成二維碼參數不合法";

    // 砍價計算比例下行
    public static String BARGAIN_TATIO_DOWN = "0.2";
    // 砍價計算比例上行
    public static String BARGAIN_TATIO_UP = "0.8";

    // 時間類型開始時間
    public static String DATE_TIME_TYPE_BEGIN = "begin";

    // 時間類型結束時間
    public static String DATE_TIME_TYPE_END = "end";

    // 商品評論類型——普通商品
    public static String STORE_REPLY_TYPE_PRODUCT = "product";
    // 商品評論類型——秒殺
    public static String STORE_REPLY_TYPE_SECKILL = "seckill";
    // 商品評論類型——拼團
    public static String STORE_REPLY_TYPE_PINTUAN = "pintuan";
    // 商品評論類型——砍價
    public static String STORE_REPLY_TYPE_BARGAIN = "bargain";

    // 商品記錄Key（pv、uv）用
    public static String PRODUCT_LOG_KEY = "visit_log_key";

    public static final String FAIL     = "FAIL";
    public static final String SUCCESS  = "SUCCESS";

    // 訂單取消Key
    public static final String ORDER_AUTO_CANCEL_KEY = "order_auto_cancel_key";

    /** 公共開關：0關閉 */
    public static final String COMMON_SWITCH_CLOSE = "0";
    /** 公共開關：1開啟 */
    public static final String COMMON_SWITCH_OPEN = "1";
}
