// ignore_for_file: avoid_unnecessary_containers

import 'package:fluent_ui/fluent_ui.dart';
import 'package:impressao/view/conn/conexao_impressora.dart';
import 'package:impressao/view/home_page/arquivos.dart';
import 'package:impressao/view/home_page/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selecionou = false;
  String nomeArquivo = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        print(constraints.maxWidth);
        return Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Testando os botao',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const Divider(),
                CommandBar(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  primaryItems: [
                    CommandBarButton(
                      icon: const Icon(FluentIcons.change_entitlements),
                      label: const Text('Troca o pdf'),
                      onPressed: () {},
                    ),
                    CommandBarButton(
                      icon: const Icon(FluentIcons.download_document),
                      label: const Text('Baixa o pdf'),
                      onPressed: () {},
                    ),
                    CommandBarButton(
                      icon: const Icon(FluentIcons.printfax_printer_file),
                      label: const Text('Imprime o pdf'),
                      onPressed: () {
                       
                      },
                    ),
                  ],
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.biggest.height,
                    maxWidth: constraints.biggest.width > 800
                        ? constraints.biggest.width / 2
                        : constraints.biggest.width,
                  ),
                  child: PdfPreview(
                    dynamicLayout: true,
                    canChangeOrientation: false,
                    canChangePageFormat: false,
                    canDebug: false,
                    build: (format) {
                      return generatePdf(format, 'testando');
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Tooltip(
                  message: 'Imprime a bagaça',
                  child: Button(
                    onPressed: conecta,
                    style: customButtonStyle,
                    child: const Text('Imprimir'),
                  ),
                ),
                const SizedBox(height: 10),
                Tooltip(
                  message: 'Imprime a bagaça',
                  child: Button(
                    onPressed: () async {
                      nomeArquivo = await pegaNomeArquivo();
                      setState(() {
                        selecionou = !selecionou;
                      });
                    },
                    style: customButtonStyle,
                    child: const Text('Arquivo'),
                  ),
                ),
                Text(nomeArquivo),
                // const SizedBox(height: 60),
              ],
            ),
          ),
        );
      }),
    );
  }
}

ButtonStyle customButtonStyle = const ButtonStyle(
    // padding: ButtonState.resolveWith((states) => const EdgeInsets.all(300.0)),
    // iconSize: ButtonState.resolveWith((states) => 100),
    );
