import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> generatePdf(PdfPageFormat format, String title) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  final font = await PdfGoogleFonts.nunitoExtraLight();

  // pdf.addPage(
  //   pw.Page(
  //     pageFormat: format,
  //     build: (context) {
  //       return pw.Column(
  //         children: [
  //           pw.SizedBox(
  //             width: 200,
  //             child: pw.FittedBox(
  //               child: pw.Text(title,
  //                   style: pw.TextStyle(font: font, fontSize: 20)),
  //             ),
  //           ),
  //           pw.SizedBox(height: 20),
  //           pw.Flexible(child: pw.FlutterLogo())
  //         ],
  //       );
  //     },
  //   ),
  // );

  pdf.addPage(
    pw.Page(
      pageFormat: format,
      build: (context) {
        return pw.Column(
          children: [
            pw.SizedBox(
              width: 200,
              child: pw.FittedBox(
                child: pw.Text(title,
                    style: pw.TextStyle(font: font, fontSize: 20)),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Flexible(child: pw.FlutterLogo())
          ],
        );
      },
    ),
  );

  return pdf.save();
}
