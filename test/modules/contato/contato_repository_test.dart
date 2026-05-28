import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';
import 'package:template_app/modules/contato/repository/contato_repository.dart';

Database _createTestDatabase() =>
    Database(DatabaseConnection(NativeDatabase.memory()));

Future<void> _insertTestUser(
  Database db, {
  required String codusuario,
  required String descnome,
  String codunidade = 'U01',
  String codperfil = 'P01',
  String codequipe = 'E01',
}) async {
  await db.batch((b) {
    b.insert(
      db.tafunidade,
      TafunidadeCompanion.insert(
        codunidade: codunidade,
        descunidade: 'Unidade 01',
      ),
      mode: InsertMode.insertOrReplace,
    );
    b.insert(
      db.tafperfil,
      TafperfilCompanion.insert(
        codperfil: codperfil,
        descperfil: 'Administrador',
      ),
      mode: InsertMode.insertOrReplace,
    );
    b.insert(
      db.tafequipe,
      TafequipeCompanion.insert(
        codequipe: codequipe,
        desequipe: 'Equipe 01',
        codunidade: codunidade,
        cdeqpai: codequipe,
      ),
      mode: InsertMode.insertOrReplace,
    );
    b.insert(
      db.tafusuario,
      TafusuarioCompanion.insert(
        codusuario: codusuario,
        codunidade: codunidade,
        codperfil: codperfil,
        codequipe: codequipe,
        descnome: descnome,
        desclogin: codusuario,
        descemail: '$codusuario@test.com',
        descsenha: 'hash',
      ),
      mode: InsertMode.insertOrReplace,
    );
  });
}

void main() {
  late ContatoRepository contatoRepository;
  late Database database;

  setUp(() async {
    database = _createTestDatabase();
    await database.customStatement('PRAGMA foreign_keys = OFF');
    contatoRepository = ContatoRepository(database: database);
  });

  tearDown(() async {
    await database.close();
  });

  group('ContatoRepository - getContatos', () {
    test('should return list of usuarios when query succeeds', () async {
      await _insertTestUser(database, codusuario: '0001', descnome: 'User One');
      await _insertTestUser(database, codusuario: '0002', descnome: 'User Two');

      final result = await contatoRepository.getContatos();

      expect(result, isNotNull);
      expect(result!.length, 2);
      expect(result[0].codusuario, '0001');
      expect(result[0].descnome, 'User One');
      expect(result[1].codusuario, '0002');
      expect(result[1].descnome, 'User Two');
    });

    test('should return empty list when no contatos exist', () async {
      final result = await contatoRepository.getContatos();

      expect(result, isNotNull);
      expect(result!.length, 0);
    });
  });

  group('ContatoRepository - getStreamContatos', () {
    test('should return list of usuarios', () async {
      await _insertTestUser(
        database,
        codusuario: '0001',
        descnome: 'Stream User',
      );

      final result = await contatoRepository.getStreamContatos();

      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result[0].descnome, 'Stream User');
    });
  });
}
