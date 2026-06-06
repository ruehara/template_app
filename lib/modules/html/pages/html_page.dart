import 'package:flutter/material.dart';
import 'package:papyrus/papyrus.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class HtmlPage extends StatefulWidget {
  const HtmlPage({super.key});

  @override
  State<HtmlPage> createState() => _HtmlPageState();
}

class _HtmlPageState extends State<HtmlPage> {
  late final PapyrusController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PapyrusController.create();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _buildHtml(AppLocalizations l10n) =>
      '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    :root { color-scheme: light dark; }
    body {
      font-family: -apple-system, Roboto, Segoe UI, sans-serif;
      margin: 0;
      padding: 24px;
      line-height: 1.6;
    }
    h1 { color: #5C6BC0; }
    .badge {
      display: inline-block;
      padding: 4px 10px;
      border-radius: 6px;
      background: #5C6BC0;
      color: #fff;
      font-size: 12px;
    }
    code {
      background: rgba(127,127,127,0.2);
      padding: 2px 6px;
      border-radius: 4px;
    }
    ul { padding-left: 20px; }
  </style>
</head>
<body>
  <span class="badge">papyrus</span>
  <h1>${l10n.htmlSampleHeading}</h1>
  <p>${l10n.htmlSampleParagraph}</p>
  <ul>
    <li><strong>HTML</strong> &amp; CSS</li>
    <li><code>PapyrusView</code></li>
    <li><code>PapyrusHtmlRequest</code></li>
  </ul>
</body>
</html>
''';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.htmlTitle)),
      body: PapyrusView(
        controller: _controller,
        initialRequest: PapyrusHtmlRequest(html: _buildHtml(l10n)),
      ),
    );
  }
}
