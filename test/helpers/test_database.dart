import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:template_app/core/database/database.dart';

Database createTestDatabase() =>
    Database(DatabaseConnection(NativeDatabase.memory()));
