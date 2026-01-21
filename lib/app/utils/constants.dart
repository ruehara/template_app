import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart';

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

/// Returns the app path
String get appPath {
  if (Platform.isWindows) {
    if (kDebugMode) {
      return p.join(Directory.current.path, debugWindowsPath);
    } else {
      return Directory.current.path;
    }
  }
  var directory = Directory.current;
  return directory.path;
}
