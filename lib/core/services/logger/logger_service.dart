import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:template_app/core/utils/env.dart';

class LoggerService {
  final String _apiUrl = Env.logErrorApiUrl;

  /// Logs an error to the console and sends it to the remote API.
  Future<void> logError(
    Object error,
    StackTrace? stackTrace, {
    String? reason,
    bool fatal = false,
    String? sourceClass,
    String? sourceMethod,
    Map<String, dynamic>? extra,
  }) async {
    // Log locally
    log(
      error.toString(),
      stackTrace: stackTrace,
      name: sourceClass ?? 'LoggerService',
      error: error,
    );

    // No remote endpoint configured: keep logging local-only.
    if (_apiUrl.isEmpty) return;

    try {
      final body = jsonEncode({
        'error': error.toString(),
        'stackTrace': stackTrace?.toString(),
        'reason': reason ?? 'Uncaught Exception',
        'fatal': fatal,
        'sourceClass': sourceClass,
        'sourceMethod': sourceMethod,
        'extra': extra,
        'platform': Platform.operatingSystem,
        'timestamp': DateTime.now().toIso8601String(),
        // Add more device info or user identifiers here if needed
      });

      // Send to API
      // We use a fire-and-forget approach (awaiting but catching errors)
      // to ensure logging failures don't crash the app.
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        log('Failed to send log to API: Status ${response.statusCode}');
      }
    } catch (e, s) {
      log(
        'Failed to send error log to API',
        error: e,
        stackTrace: s,
        name: 'LoggerService',
      );
    }
  }
}
