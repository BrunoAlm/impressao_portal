// ignore_for_file: avoid_unnecessary_containers

import 'package:fluent_ui/fluent_ui.dart';
import 'package:impressao/view/conn/conexao_impressora.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: const [
            Text('Home Page'),
            Button(onPressed: conecta, child: Text('Imprimir')),
          ],
        ),
      ),
    );
  }
}
