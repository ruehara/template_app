import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  List<Printer> _printers = [];
  bool _loading = true;
  bool _printing = false;
  Printer? _selected;

  @override
  void initState() {
    super.initState();
    _loadPrinters();
  }

  Future<void> _loadPrinters() async {
    try {
      final list = await Printing.listPrinters();
      if (mounted) {
        setState(() {
          _printers = list;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<Uint8List> _buildDocument(PdfPageFormat format) async {
    final doc = pw.Document(title: 'Template App — Print Test');

    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (_) => pw.Padding(
          padding: const pw.EdgeInsets.all(32),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Print Test — Flutter Template App',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Divider(),
              pw.SizedBox(height: 16),
              pw.Text('Printed on: ${DateTime.now().toLocal()}'),
              pw.SizedBox(height: 12),
              pw.Text(
                'This document was generated programmatically and printed from a Flutter app using the printing package.',
              ),
              pw.SizedBox(height: 24),
              pw.Container(
                padding: const pw.EdgeInsets.all(12),
                decoration: const pw.BoxDecoration(
                  color: PdfColors.grey200,
                  borderRadius:
                      pw.BorderRadius.all(pw.Radius.circular(6)),
                ),
                child: pw.Text(
                  'Package: pub.dev/packages/printing',
                  style: const pw.TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return doc.save();
  }

  Future<void> _print() async {
    if (_selected == null) return;
    setState(() => _printing = true);
    try {
      await Printing.directPrintPdf(
        printer: _selected!,
        onLayout: _buildDocument,
        name: 'template_app_print.pdf',
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.printerSuccess)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.printerError(e.toString())),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _printing = false);
    }
  }

  Future<void> _preview() async {
    await Printing.layoutPdf(
      name: 'template_app_print_preview.pdf',
      onLayout: _buildDocument,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.printerTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.preview_outlined),
            tooltip: l10n.printerPreview,
            onPressed: _preview,
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    l10n.printerListLabel,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Expanded(
                  child: _printers.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.print_disabled,
                                size: 64,
                                color: theme.colorScheme.outline,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                l10n.printerNoDevices,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      : RadioGroup<Printer>(
                          groupValue: _selected,
                          onChanged: (v) => setState(() => _selected = v),
                          child: ListView.builder(
                            itemCount: _printers.length,
                            itemBuilder: (_, i) {
                              final p = _printers[i];
                              return RadioListTile<Printer>(
                                value: p,
                                title: Text(p.name),
                                subtitle: p.location != null
                                    ? Text(p.location!)
                                    : null,
                                secondary: Icon(
                                  p.isDefault
                                      ? Icons.print
                                      : Icons.print_outlined,
                                  color: p.isDefault
                                      ? theme.colorScheme.primary
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: (_selected == null || _printing) ? null : _print,
                      icon: _printing
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.print),
                      label: Text(
                        _printing ? l10n.printerPrinting : l10n.printerPrint,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
