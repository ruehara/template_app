class Env {
  static String get apiKey => const String.fromEnvironment('API_KEY');
  static String get baseUrl => const String.fromEnvironment('BASE_URL');
  static String get flavor =>
      const String.fromEnvironment('FLAVOR', defaultValue: 'development');
  static String get logErrorApiUrl => const String.fromEnvironment(
    'LOG_ERROR_API_URL',
    defaultValue: 'http://localhost:5000/api/log',
  );
  static String get dbSeedEnabled =>
      const String.fromEnvironment('DB_SEED_ENABLED', defaultValue: 'true');
}
