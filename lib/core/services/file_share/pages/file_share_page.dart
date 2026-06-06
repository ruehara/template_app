import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class FileSharePage extends StatefulWidget {
  const FileSharePage({super.key});

  @override
  State<FileSharePage> createState() => _FileSharePageState();
}

class _FileSharePageState extends State<FileSharePage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController(
    text: 'Hello from Flutter Template App! 🚀',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _share() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        text: _controller.text.trim(),
        subject: 'Template App',
        sharePositionOrigin: box == null
            ? null
            : box.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.fileShareTitle)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.share_outlined,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: l10n.fileShareLabel,
                  hintText: l10n.fileShareHint,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.text_fields),
                ),
                maxLines: 5,
                minLines: 3,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? l10n.fileShareEmptyError
                    : null,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _share,
                icon: const Icon(Icons.share),
                label: Text(l10n.fileShareShareButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
