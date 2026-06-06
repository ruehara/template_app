import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const counterVar = 'counter';
const localeVar = 'locale';
const themeVar = 'theme';
const authUserIdVar = 'authUserId';
const databaseName = 'database.db3';

/// Stores the database folder
const databaseDir = 'Database';

/// Stores the log folder
const logDir = 'Log';

/// Stores the Files
const filesDir = 'Files';

/// Stores the Media Files
const mediaDir = 'Media';

/// Stores the debug windows path
const debugWindowsPath = 'build\\windows\\x64\\runner\\Debug';

// logErrorApiUrl is now configured via Env.logErrorApiUrl (dart-define)

String _appPath = '';

/// Returns the app path (must call [initAppPath] first during bootstrap)
String get appPath => _appPath;

/// Initializes [appPath] once at startup using the correct platform directory.
Future<void> initAppPath() async {
  if (Platform.isWindows) {
    _appPath = kDebugMode
        ? p.join(Directory.current.path, debugWindowsPath)
        : Directory.current.path;
  } else {
    final dir = await getApplicationDocumentsDirectory();
    _appPath = dir.path;
  }
}
