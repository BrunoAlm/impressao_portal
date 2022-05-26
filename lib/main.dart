import 'package:fluent_ui/fluent_ui.dart';
import 'view/home_page/home_page.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
