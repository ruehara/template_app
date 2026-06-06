import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final doc = pw.Document(title: 'Flutter Template App');

    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (_) => pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                'Flutter Template App',
                style: pw.TextStyle(
                  fontSize: 28,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'PDF Generation Example',
                style: const pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 12),
              pw.Divider(),
              pw.SizedBox(height: 12),
              pw.Text(
                'Generated: ${DateTime.now().toLocal()}',
                style: const pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 32),
              pw.Container(
                padding: const pw.EdgeInsets.all(16),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.indigo),
                  borderRadius:
                      const pw.BorderRadius.all(pw.Radius.circular(8)),
                ),
                child: pw.Text(
                  'Built with Flutter · pdf package · printing package',
                  style: pw.TextStyle(
                    color: PdfColors.indigo,
                    fontStyle: pw.FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return doc.save();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.pdfTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.picture_as_pdf_outlined,
                size: 88,
                color: Color(0xFFFF7043),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.pdfInfo,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40),
              FilledButton.icon(
                onPressed: () => Printing.layoutPdf(
                  name: 'template_app_sample.pdf',
                  onLayout: _buildPdf,
                ),
                icon: const Icon(Icons.open_in_new),
                label: Text(l10n.pdfPreview),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
