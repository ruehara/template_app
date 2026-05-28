import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';
import 'package:template_app/core/utils/exceptions.dart';
import 'i_contato_repository.dart';

class ContatoRepository implements IContatoRepository {
  ContatoRepository({required Database database}) : _db = database;

  final Database _db;

  @override
  Future<List<Usuario>?> getContatos() async {
    try {
      return _db.select(_db.tafusuario).get();
    } catch (e) {
      throw DatabaseException('Erro ao buscar contatos: $e');
    }
  }

  @override
  Future<List<Usuario>?> getStreamContatos() async {
    try {
      return _db.select(_db.tafusuario).get();
    } catch (e) {
      throw DatabaseException('Erro ao buscar contatos: $e');
    }
  }
}
