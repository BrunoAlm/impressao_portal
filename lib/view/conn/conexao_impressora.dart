import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

import 'criacao_impressao.dart';

Future conecta() async {
  const PaperSize paper = PaperSize.mm80;
  final profile = await CapabilityProfile.load();
  final printer = NetworkPrinter(paper, profile);

  final PosPrintResult res = await printer.connect('10.0.3.98', port: 9100);

  if (res == PosPrintResult.success) {
    testReceipt(printer);
    printer.disconnect();
  }

  print('Print result: ${res.msg}');
}
