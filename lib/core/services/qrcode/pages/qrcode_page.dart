import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:template_app/core/services/localization/l10n.dart';

bool get _scannerSupported {
  if (kIsWeb) return true;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  MobileScannerController? _controller;
  String? _scannedValue;
  bool _torchOn = false;
  bool _scanning = true;

  @override
  void initState() {
    super.initState();
    if (_scannerSupported) {
      _controller = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.firstOrNull;
    final value = barcode?.rawValue;
    if (value == null) return;

    setState(() {
      _scannedValue = value;
      _scanning = false;
    });
    _controller?.stop();
  }

  void _reset() {
    setState(() {
      _scannedValue = null;
      _scanning = true;
    });
    _controller?.start();
  }

  Future<void> _copyToClipboard() async {
    if (_scannedValue == null) return;
    await Clipboard.setData(ClipboardData(text: _scannedValue!));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.qrCodeCopiedMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    if (_controller == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.qrCodeTitle)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, size: 48, color: theme.colorScheme.outline),
              const SizedBox(height: 16),
              Text(l10n.qrCodeNotSupported, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.qrCodeTitle),
        actions: [
          IconButton(
            icon: Icon(_torchOn ? Icons.flash_on : Icons.flash_off),
            tooltip: l10n.qrCodeTorchTooltip,
            onPressed: () {
              _controller!.toggleTorch();
              setState(() => _torchOn = !_torchOn);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: _scanning
                ? Stack(
                    children: [
                      MobileScanner(
                        controller: _controller!,
                        onDetect: _onDetect,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            l10n.qrCodeScanPrompt,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    color: theme.colorScheme.surfaceContainerLowest,
                    child: const Center(
                      child: Icon(Icons.qr_code_2, size: 120),
                    ),
                  ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: _scannedValue == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 16),
                          Text(
                            l10n.qrCodeWaiting,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              l10n.qrCodeSuccess,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _scannedValue!,
                            style: theme.textTheme.bodyMedium,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _copyToClipboard,
                                icon: const Icon(Icons.copy, size: 18),
                                label: Text(l10n.copyButton),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: _reset,
                                icon: const Icon(Icons.qr_code_scanner, size: 18),
                                label: Text(l10n.qrCodeScanButton),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
