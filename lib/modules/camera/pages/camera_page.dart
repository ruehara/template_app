import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template_app/core/services/localization/l10n.dart';

bool get _cameraSupported {
  if (kIsWeb) return true;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? _image;
  bool _loading = false;

  Future<void> _pick(ImageSource source) async {
    setState(() => _loading = true);
    try {
      final file = await ImagePicker().pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 1080,
      );
      if (!mounted) return;
      setState(() => _image = file);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.cameraErrorPicking)),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    if (!_cameraSupported) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.cameraTitle)),
        body: _UnsupportedFeature(
          icon: Icons.camera_alt_outlined,
          message: l10n.cameraNotSupported,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cameraTitle)),
      body: Column(
        children: [
          Expanded(
            child: _image == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.photo_camera_outlined,
                          size: 80,
                          color: theme.colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.cameraNoImage,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : kIsWeb
                    ? Image.network(_image!.path, fit: BoxFit.contain)
                    : Image.file(File(_image!.path), fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => _pick(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: Text(l10n.cameraPickGallery),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed:
                        _loading ? null : () => _pick(ImageSource.camera),
                    icon: _loading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.camera_alt),
                    label: Text(l10n.cameraTakePhoto),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UnsupportedFeature extends StatelessWidget {
  const _UnsupportedFeature({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
