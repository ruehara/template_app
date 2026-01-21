import 'package:template_app/app/app.dart';
import 'package:template_app/app/init/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
