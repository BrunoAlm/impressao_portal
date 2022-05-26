import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

void testReceipt(NetworkPrinter printer) {
  printer.text(
      'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
  printer.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
      styles: const PosStyles(codeTable: 'CP1252'));
  printer.text('Special 2: blåbærgrød',
      styles: const PosStyles(codeTable: 'CP1252'));

  printer.text('Bold text', styles: const PosStyles(bold: true));
  printer.text('Reverse text', styles: const PosStyles(reverse: true));
  printer.text('Underlined text',
      styles: const PosStyles(underline: true), linesAfter: 1);
  printer.text('Align left', styles: const PosStyles(align: PosAlign.left));
  printer.text('Align center', styles: const PosStyles(align: PosAlign.center));
  printer.text('Align right',
      styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

  printer.text('Text size 200%',
      styles: const PosStyles(
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ));

  printer.feed(2);
  printer.cut();
}
