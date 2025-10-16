/// API configuration constants
///
/// Use environment variables to set different URLs for different build environments:
///
/// Development:
///   flutter run --dart-define=BASE_URL=https://dev.tratrouble.chobycat.com
///
/// Production:
///   flutter build apk --dart-define=BASE_URL=https://tratrouble.chobycat.com
class ApiConstants {
  /// Base URL for the backend API
  /// Defaults to production URL if not specified via --dart-define
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://tratrouble.chobycat.com',
  );

  /// Endpoint for submitting email and receiving authentication token
  static const String submitEmailEndpoint = '/api/submit-email/';

  /// Full URL for email submission
  static String get submitEmailUrl => '$baseUrl$submitEmailEndpoint';
}
