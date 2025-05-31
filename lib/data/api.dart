class Api {
  /// base url
 static const baseUrl = "http://192.168.10.43:5010/api/v1";
// static const baseUrl = "https://2877-115-127-156-9.ngrok-free.app/api/v1";
 // static const baseUrl = "http://172.252.13.83:5001/api/v1";



  ///auth
  static const login = "$baseUrl/auth/login";
  static const signup = "$baseUrl/auth/vendor-sign-up";
  static const resetPassword = "$baseUrl/auth/reset-forgotten-password";
  static const verifyOtp = "$baseUrl/auth/verify-otp";
  static const sendOtp = "$baseUrl/auth/send-otp";
  static const profile = "$baseUrl/vendors/profile";
  static const vendorUpdate = "$baseUrl/vendors";
  static const changePassword = "$baseUrl/auth/change-password";
  static const products = "$baseUrl/products";
  static const categories = "$baseUrl/categories";
  static const vendorOrder = "$baseUrl/orders/vendor";
  static const supports = "$baseUrl/supports";
  static const settings = "$baseUrl/settings";

  static  allProduct({required String storeID}) =>  "$baseUrl/products?store=$storeID";
  static  productApi({required String productId}) =>  "$baseUrl/products/$productId";
  static  orderStatue({required String orderId}) =>  "$baseUrl/orders/$orderId";
  static  updateStore({required String storeID}) =>  "$baseUrl/stores/$storeID";



}