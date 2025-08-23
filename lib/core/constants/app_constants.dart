class AppConstants {
  // App Information
  static const String appName = 'RaphPay';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Your Financial Future Starts Here';
  
  // API Configuration
  static const String baseUrl = 'https://api.raphpay.com';
  static const String apiVersion = '/v1';
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  
  // Endpoints
  static const String authEndpoint = '/auth';
  static const String userEndpoint = '/user';
  static const String transactionEndpoint = '/transactions';
  static const String accountEndpoint = '/accounts';
  static const String paymentEndpoint = '/payments';
  
  // Local Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  static const String biometricKey = 'biometric_enabled';
  
  // Validation Rules
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minPinLength = 4;
  static const int maxPinLength = 6;
  
  // Transaction Limits
  static const double minTransactionAmount = 0.01;
  static const double maxTransactionAmount = 1000000.00;
  static const double dailyTransactionLimit = 50000.00;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultRadius = 12.0;
  static const double smallRadius = 8.0;
  static const double largeRadius = 16.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Error Messages
  static const String networkError = 'Network connection error. Please check your internet connection.';
  static const String serverError = 'Server error. Please try again later.';
  static const String unauthorizedError = 'Unauthorized access. Please login again.';
  static const String validationError = 'Please check your input and try again.';
  static const String unknownError = 'An unexpected error occurred. Please try again.';
  
  // Success Messages
  static const String loginSuccess = 'Login successful!';
  static const String registrationSuccess = 'Account created successfully!';
  static const String transactionSuccess = 'Transaction completed successfully!';
  static const String profileUpdateSuccess = 'Profile updated successfully!';
  
  // Currency
  static const String defaultCurrency = 'USD';
  static const String defaultCurrencySymbol = '\$';
  
  // Date Formats
  static const String dateFormat = 'MMM dd, yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'MMM dd, yyyy HH:mm';
  
  // Biometric Authentication
  static const String biometricTitle = 'Biometric Authentication';
  static const String biometricSubtitle = 'Please authenticate to continue';
  static const String biometricCancel = 'Cancel';
  
  // Navigation Routes
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String dashboardRoute = '/dashboard';
  static const String profileRoute = '/profile';
  static const String settingsRoute = '/settings';
  static const String transactionsRoute = '/transactions';
  static const String sendMoneyRoute = '/send-money';
  static const String receiveMoneyRoute = '/receive-money';
  
  // Feature Flags
  static const bool enableBiometric = true;
  static const bool enablePushNotifications = true;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
}
