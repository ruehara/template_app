import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/core/app_config/app_routes.dart';
import 'package:template_app/core/services/localization/cubit/language_cubit.dart';
import 'package:template_app/core/services/localization/l10n.dart';
import 'package:template_app/core/services/theme/cubit/theme_cubit.dart';
import 'package:template_app/core/utils/exit_dialog.dart';
import 'package:template_app/modules/home/model/feature_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<AppExitResponse> didRequestAppExit() async {
    AppExitResponse response = AppExitResponse.cancel;
    if (context.mounted) {
      response = await ExitPopupDialog.show(context).then(
        (value) => (value as bool? ?? false)
            ? AppExitResponse.exit
            : AppExitResponse.cancel,
      );
    }
    if (response == AppExitResponse.cancel) return response;
    exit(0);
  }

  Future<bool> _exitApp() async {
    if (!context.canPop()) {
      final bool ret = await ExitPopupDialog.show(context)
          .then((value) => (value as bool?) ?? false);
      if (ret) exit(0);
    }
    return true;
  }

  List<FeatureItem> _buildFeatures(AppLocalizations l10n) => [
    FeatureItem(
      title: l10n.featureAuthTitle,
      subtitle: l10n.featureAuthSubtitle,
      icon: Icons.lock_outline,
      category: FeatureCategory.dados,
      routeName: AppRoutes.profileName,
      color: const Color(0xFF5C6BC0),
    ),
    FeatureItem(
      title: l10n.featureContactsTitle,
      subtitle: l10n.featureContactsSubtitle,
      icon: Icons.contacts_outlined,
      category: FeatureCategory.dados,
      routeName: AppRoutes.contatoName,
      color: const Color(0xFF26A69A),
    ),
    FeatureItem(
      title: l10n.featureHttpListTitle,
      subtitle: l10n.featureHttpListSubtitle,
      icon: Icons.people_outline,
      category: FeatureCategory.rede,
      routeName: AppRoutes.userListName,
      color: const Color(0xFF42A5F5),
    ),
    FeatureItem(
      title: l10n.featureConnectivityTitle,
      subtitle: l10n.featureConnectivitySubtitle,
      icon: Icons.wifi,
      category: FeatureCategory.rede,
      routeName: AppRoutes.networkName,
      color: const Color(0xFF26C6DA),
    ),
    FeatureItem(
      title: l10n.featureBiometricTitle,
      subtitle: l10n.featureBiometricSubtitle,
      icon: Icons.fingerprint,
      category: FeatureCategory.hardware,
      routeName: AppRoutes.biometricName,
      color: const Color(0xFFEC407A),
    ),
    FeatureItem(
      title: l10n.featureSensorsTitle,
      subtitle: l10n.featureSensorsSubtitle,
      icon: Icons.sensors,
      category: FeatureCategory.hardware,
      routeName: AppRoutes.sensorsName,
      color: const Color(0xFFFF7043),
    ),
    FeatureItem(
      title: l10n.featureQrCodeTitle,
      subtitle: l10n.featureQrCodeSubtitle,
      icon: Icons.qr_code_scanner,
      category: FeatureCategory.hardware,
      routeName: AppRoutes.qrCodeName,
      color: const Color(0xFF66BB6A),
    ),
    FeatureItem(
      title: l10n.featureCameraTitle,
      subtitle: l10n.featureCameraSubtitle,
      icon: Icons.camera_alt_outlined,
      category: FeatureCategory.hardware,
      routeName: AppRoutes.cameraName,
      color: const Color(0xFFAB47BC),
    ),
    FeatureItem(
      title: l10n.featureBluetoothTitle,
      subtitle: l10n.featureBluetoothSubtitle,
      icon: Icons.bluetooth,
      category: FeatureCategory.hardware,
      routeName: AppRoutes.bluetoothName,
      color: const Color(0xFF29B6F6),
    ),
    FeatureItem(
      title: l10n.featureGeoTitle,
      subtitle: l10n.featureGeoSubtitle,
      icon: Icons.location_on_outlined,
      category: FeatureCategory.hardware,
      routeName: AppRoutes.geolocationName,
      color: const Color(0xFFEF5350),
    ),
    FeatureItem(
      title: l10n.featurePdfTitle,
      subtitle: l10n.featurePdfSubtitle,
      icon: Icons.picture_as_pdf_outlined,
      category: FeatureCategory.midia,
      routeName: AppRoutes.pdfName,
      color: const Color(0xFFFF7043),
    ),
    FeatureItem(
      title: l10n.featureFileShareTitle,
      subtitle: l10n.featureFileShareSubtitle,
      icon: Icons.share_outlined,
      category: FeatureCategory.midia,
      routeName: AppRoutes.fileShareName,
      color: const Color(0xFF26A69A),
    ),
    FeatureItem(
      title: l10n.featurePrinterTitle,
      subtitle: l10n.featurePrinterSubtitle,
      icon: Icons.print_outlined,
      category: FeatureCategory.midia,
      routeName: AppRoutes.printerName,
      color: const Color(0xFF5C6BC0),
    ),
    FeatureItem(
      title: l10n.featureHtmlTitle,
      subtitle: l10n.featureHtmlSubtitle,
      icon: Icons.html,
      category: FeatureCategory.midia,
      routeName: AppRoutes.htmlName,
      color: const Color(0xFFE65100),
    ),
    FeatureItem(
      title: l10n.featureAudioTitle,
      subtitle: l10n.featureAudioSubtitle,
      icon: Icons.music_note_outlined,
      category: FeatureCategory.midia,
      routeName: '',
      available: false,
      color: const Color(0xFF00BCD4),
    ),
    FeatureItem(
      title: l10n.featureChartsTitle,
      subtitle: l10n.featureChartsSubtitle,
      icon: Icons.bar_chart,
      category: FeatureCategory.ui,
      routeName: AppRoutes.chartsName,
      color: const Color(0xFF5C6BC0),
    ),
    FeatureItem(
      title: l10n.featureLottiesTitle,
      subtitle: l10n.featureLottiesSubtitle,
      icon: Icons.animation,
      category: FeatureCategory.ui,
      routeName: AppRoutes.lottiesName,
      color: const Color(0xFFFFCA28),
    ),
    FeatureItem(
      title: l10n.featureCounterTitle,
      subtitle: l10n.featureCounterSubtitle,
      icon: Icons.add_circle_outline,
      category: FeatureCategory.ui,
      routeName: AppRoutes.counterName,
      color: const Color(0xFF78909C),
    ),
  ];

  String _categoryLabel(FeatureCategory cat, AppLocalizations l10n) {
    return switch (cat) {
      FeatureCategory.dados => l10n.categoryData,
      FeatureCategory.rede => l10n.categoryNetwork,
      FeatureCategory.hardware => l10n.categoryHardware,
      FeatureCategory.midia => l10n.categoryMedia,
      FeatureCategory.ui => l10n.categoryUI,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        _exitApp();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.homeTitle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              tooltip: l10n.homeLanguageTooltip,
              onPressed: () => context.language.updateAppLocale(),
            ),
            IconButton(
              icon: const Icon(Icons.dark_mode),
              tooltip: l10n.homeThemeTooltip,
              onPressed: () => context.theme.updateAppTheme(),
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              tooltip: l10n.profileLabel,
              onPressed: () => context.pushNamed(AppRoutes.profileName),
            ),
          ],
        ),
        body: _FeatureGrid(
          features: _buildFeatures(l10n),
          categoryLabel: (cat) => _categoryLabel(cat, l10n),
          theme: theme,
        ),
      ),
    );
  }
}

class _FeatureGrid extends StatelessWidget {
  const _FeatureGrid({
    required this.features,
    required this.categoryLabel,
    required this.theme,
  });

  final List<FeatureItem> features;
  final String Function(FeatureCategory) categoryLabel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    const categories = FeatureCategory.values;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final items = features.where((f) => f.category == category).toList();
        if (items.isEmpty) return const SizedBox.shrink();
        return _CategorySection(
          label: categoryLabel(category),
          items: items,
          theme: theme,
        );
      },
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({
    required this.label,
    required this.items,
    required this.theme,
  });

  final String label;
  final List<FeatureItem> items;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) =>
              _FeatureCard(item: items[index], theme: theme),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.item, required this.theme});

  final FeatureItem item;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final color = item.color ?? theme.colorScheme.primary;
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: item.available ? 2 : 0,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: item.available && item.routeName.isNotEmpty
            ? () => context.pushNamed(item.routeName)
            : null,
        child: Opacity(
          opacity: item.available ? 1.0 : 0.45,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: isDark ? 0.25 : 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(item.icon, size: 20, color: color),
                    ),
                    const Spacer(),
                    if (!item.available)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          context.l10n.comingSoon,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  item.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
