class Env {
  static String get apiKey => const String.fromEnvironment('API_KEY');
  static String get baseUrl => const String.fromEnvironment('BASE_URL');
  static String get flavor =>
      const String.fromEnvironment('FLAVOR', defaultValue: 'development');
  /// Remote endpoint for error logging. Empty by default so a misconfigured
  /// build never ships errors to an unintended (or insecure) host — set it via
  /// `--dart-define=LOG_ERROR_API_URL=https://...` to enable remote logging.
  static String get logErrorApiUrl =>
      const String.fromEnvironment('LOG_ERROR_API_URL');

  /// Whether the database should be seeded on first creation. Disabled by
  /// default; enable in development with `--dart-define=DB_SEED_ENABLED=true`.
  static bool get isDbSeedEnabled =>
      const bool.fromEnvironment('DB_SEED_ENABLED');
}
