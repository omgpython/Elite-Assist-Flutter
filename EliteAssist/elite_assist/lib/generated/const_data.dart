class ConstantData {
// Server Address
  static final String SERVER_ADDRESS = "http://192.168.1.4:8000/";

//Shared Preferences Key
  static final String KEY_ID_SP = "ID";
  static final String KEY_NAME_SP = "NAME";
  static final String KEY_EMAIL_SP = "EMAIL";
  static final String KEY_CONTACT_SP = "CONTACT";
  static final String IS_LOGIN_SP = "IS_LOGIN";

//API Address

  //Login - Register
  static final String REGISTER_USER_API = SERVER_ADDRESS + "register_user";
  static final String CHECK_USER_API = SERVER_ADDRESS + "checkemail";
  static final String LOGIN_USER_API = SERVER_ADDRESS + "login";

  //Banner
  static final String BANNER_API = SERVER_ADDRESS + "api/getbanner";

  //Services
  static final String SERVICE_API = SERVER_ADDRESS + "api/getservice";

  //Sub-Services
  static final String SUB_SERVICE_API = SERVER_ADDRESS + "api/getSubService";

  //Products
  static final String PRODUCT_API =
      SERVER_ADDRESS + "api/getProductFromSubService";
  static final String GET_ALL_PRODUCT_API = SERVER_ADDRESS + "api/getproduct";
  static final String GET_MAN_PRODUCT_API = SERVER_ADDRESS + "api/getMale";
  static final String GET_WOMAN_PRODUCT_API = SERVER_ADDRESS + "api/getFeMale";
  static final String RELATED_PRODUCT_API =
      SERVER_ADDRESS + "api/relatedproduct";

  //Coupon
  static final String COUPON_API = SERVER_ADDRESS + "api/getcoupen";
  static final String APPLY_COUPON_API = SERVER_ADDRESS + "api/applycoupon";

  //Address
  static final String ADD_ADDRESS_API = SERVER_ADDRESS + "api/addaddress";
  static final String ADDRESS_API = SERVER_ADDRESS + "api/getaddress";

  //Orders
  static final String ADD_ORDER_API = SERVER_ADDRESS + "api/addOrder";
}
