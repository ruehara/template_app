import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:template_app/core/utils/constants.dart';
import 'package:template_app/core/services/logger/database_logger.dart';

Future<File> get databaseFile async {
  final dbPath = p.join(appPath, databaseDir, databaseName);
  return File(dbPath);
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(
    Future(() async {
      return NativeDatabase.createBackgroundConnection(await databaseFile);
    }),
  ).interceptWith(DatabaseLogger());
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  database.schemaVersion;
}
