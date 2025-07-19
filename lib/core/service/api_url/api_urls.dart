class ApiUrls {
  static const String _baseUrl = "https://ecom-rs8e.onrender.com/api";
  static const String signInUrl = "$_baseUrl/auth/login";
  static const String signUpUrl = "$_baseUrl/auth/signup";
  static const String verifyOtpUrl = "$_baseUrl/auth/verify-otp";
  static const String loadSliderUrl = "$_baseUrl/slides";
  static String categoryListUrl(int count, int currentPage) =>
      "$_baseUrl/categories?count=$count&page=$currentPage";
  static String productListByCategoryUrl(
    int count,
    int currentPage,
    String categoryId,
  ) => "$_baseUrl/products?count=$count&page=$currentPage&category=$categoryId";
}
