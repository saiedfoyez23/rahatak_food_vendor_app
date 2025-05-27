class Api {
  /// base url
  static const baseUrl = "http://192.168.10.43:5010/api/v1";



  ///auth
  static const login = "$baseUrl/auth/login";
  static const signup = "$baseUrl/auth/vendor-sign-up";
  static const resetPassword = "$baseUrl/auth/reset-forgotten-password";
  static const verifyOtp = "$baseUrl/auth/verify-otp";
  static const sendOtp = "$baseUrl/auth/send-otp";
  static const profile = "$baseUrl/vendors/profile";

  static  allProduct({required String storeID}) =>  "$baseUrl/products?store=$storeID";


}