import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.networkTitle)),
      body: StreamBuilder<List<ConnectivityResult>>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final results = snapshot.data ?? [];
          return _NetworkBody(results: results);
        },
      ),
    );
  }
}

class _NetworkBody extends StatelessWidget {
  const _NetworkBody({required this.results});

  final List<ConnectivityResult> results;

  bool get _isOnline =>
      results.isNotEmpty && !results.contains(ConnectivityResult.none);

  IconData _iconFor(ConnectivityResult r) {
    return switch (r) {
      ConnectivityResult.wifi => Icons.wifi,
      ConnectivityResult.mobile => Icons.signal_cellular_alt,
      ConnectivityResult.ethernet => Icons.cable,
      ConnectivityResult.bluetooth => Icons.bluetooth,
      ConnectivityResult.vpn => Icons.vpn_lock,
      ConnectivityResult.other => Icons.device_hub,
      ConnectivityResult.none || _ => Icons.wifi_off,
    };
  }

  String _labelFor(ConnectivityResult r, AppLocalizations l10n) {
    return switch (r) {
      ConnectivityResult.wifi => l10n.networkWifi,
      ConnectivityResult.mobile => l10n.networkMobile,
      ConnectivityResult.ethernet => l10n.networkEthernet,
      ConnectivityResult.bluetooth => l10n.networkBluetooth,
      ConnectivityResult.vpn => l10n.networkVpn,
      ConnectivityResult.other => l10n.networkOther,
      ConnectivityResult.none || _ => l10n.networkNone,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final color = _isOnline ? Colors.green : Colors.red;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Icon(
                _isOnline ? Icons.cloud_done_outlined : Icons.cloud_off_outlined,
                key: ValueKey(_isOnline),
                size: 80,
                color: color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _isOnline ? l10n.networkOnline : l10n.networkOffline,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 32),
            if (results.isEmpty)
              _StatusChip(
                icon: Icons.wifi_off,
                label: l10n.networkChecking,
                color: theme.colorScheme.outline,
              )
            else
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: results
                    .map(
                      (r) => _StatusChip(
                        icon: _iconFor(r),
                        label: _labelFor(r, l10n),
                        color: r == ConnectivityResult.none
                            ? Colors.red
                            : Colors.green,
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(height: 40),
            Text(
              l10n.networkStreamInfo,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      side: BorderSide(color: color.withValues(alpha: 0.4)),
    );
  }
}
