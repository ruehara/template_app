import 'package:template_app/core/database/tables/schema.drift.dart';

abstract interface class IContatoRepository {
  Future<List<Usuario>> getContatos();
}
