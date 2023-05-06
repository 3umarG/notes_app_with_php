abstract class ApiConstants{
  static const  String _baseUrl = "http://192.168.1.40:8080/note_app";

  static const String signUpPath = "$_baseUrl/auth/signup.php";
  static const String signInPath = "$_baseUrl/auth/signin.php";

  static const String noInternetExceptionMessage = "تحقق من اتصالك بالانترنت";
  static const String clientExceptionMessage = "تحقق من صحة البيانات المدخلة";
  static const String serverExceptionMessage = "هناك خطأ في الخدمة الرجاء المحاولة مرة أخرى لاحقاً";
  static const String timeoutExceptionMessage = "استغرق طلبك الكثير من الوقت , الرجاء المحاولة مرة أخرى .";
}