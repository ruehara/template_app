import 'package:drift/drift.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/core/database/database.dart';

class MockDatabase extends Mock implements Database {}

class MockQueryRow extends Mock implements QueryRow {}

class MockSelectable<T> extends Mock implements Selectable<T> {}

class MockBatch extends Mock implements Batch {}
