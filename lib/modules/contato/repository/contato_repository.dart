import 'package:get_it/get_it.dart';
import 'package:template_app/database/database.dart';
import 'package:template_app/database/tables/tafusuario.drift.dart';

class ContatoRepository {
  final Database db = GetIt.instance<Database>();
  Future<List<Usuario>?> getContatos() async {
    return await db
        .customSelect('select codusuario, descnome from tafusuario')
        .get()
        .then((rows) {
          return rows
              .map(
                (row) => Usuario(
                  codusuario: row.read<String>('codusuario'),
                  descnome: row.read<String>('descnome'),
                  codunidade: '',
                  codperfil: '',
                  codequipe: '',
                  desclogin: '',
                  descsenha: '',
                  descemail: '',
                ),
              )
              .toList();
        });
  }

  Future<List<Usuario>?> getStreamContatos() async {
    return await db
        .customSelect('select codusuario, descnome from tafusuario')
        .get()
        .then((rows) {
          return rows
              .map(
                (row) => Usuario(
                  codusuario: row.read<String>('codusuario'),
                  descnome: row.read<String>('descnome'),
                  codunidade: '',
                  codperfil: '',
                  codequipe: '',
                  desclogin: '',
                  descsenha: '',
                  descemail: '',
                ),
              )
              .toList();
        });
  }
}
