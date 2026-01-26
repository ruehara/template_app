import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:template_app/app/utils/constants.dart';

Future<File> get databaseFile async {
  final dbPath = p.join(appPath, databaseDir, databaseName);
  return File(dbPath);
}

DatabaseConnection connect() {
  return DatabaseConnection.delayed(
    Future(() async {
      return NativeDatabase.createBackgroundConnection(await databaseFile);
    }),
  );
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  database.schemaVersion;
}
