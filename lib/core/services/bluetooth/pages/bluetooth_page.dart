import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:template_app/core/services/localization/l10n.dart';

bool get _bluetoothSupported {
  if (kIsWeb) return false;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  State<BluetoothPage> createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  bool _isScanning = false;
  bool _adapterOn = false;
  List<BluetoothDevice> _bondedDevices = [];
  List<ScanResult> _results = [];

  // Keeps the best known name per device ID.
  // Only updates to non-empty values so a name seen once is never lost,
  // even if later advertisement packets omit it.
  final Map<String, String> _nameCache = {};

  StreamSubscription<BluetoothAdapterState>? _adapterSub;
  StreamSubscription<List<ScanResult>>? _scanSub;

  @override
  void initState() {
    super.initState();
    if (!_bluetoothSupported) return;
    _adapterSub = FlutterBluePlus.adapterState.listen((state) {
      final isOn = state == BluetoothAdapterState.on;
      if (mounted) setState(() => _adapterOn = isOn);
      if (isOn) _loadBondedDevices();
    });
  }

  @override
  void dispose() {
    _adapterSub?.cancel();
    _scanSub?.cancel();
    if (_bluetoothSupported) FlutterBluePlus.stopScan();
    super.dispose();
  }

  /// Loads paired/bonded devices (Android only) and primes the name cache.
  Future<void> _loadBondedDevices() async {
    if (kIsWeb || !Platform.isAndroid) return;
    try {
      final bonded = await FlutterBluePlus.bondedDevices;
      for (final d in bonded) {
        if (d.platformName.isNotEmpty) {
          _nameCache[d.remoteId.str] = d.platformName;
        }
      }
      if (mounted) setState(() => _bondedDevices = bonded);
    } catch (_) {}
  }

  Future<void> _startScan() async {
    setState(() {
      _isScanning = true;
      _results = [];
      _nameCache.clear();
    });

    // Re-prime cache from already-loaded bonded devices (no extra API call).
    for (final d in _bondedDevices) {
      if (d.platformName.isNotEmpty) _nameCache[d.remoteId.str] = d.platformName;
    }
    // Also capture names of devices currently connected at the OS level.
    try {
      for (final d in await FlutterBluePlus.systemDevices([])) {
        if (d.platformName.isNotEmpty && !_nameCache.containsKey(d.remoteId.str)) {
          _nameCache[d.remoteId.str] = d.platformName;
        }
      }
    } catch (_) {}

    if (!mounted) return;

    _scanSub?.cancel();
    _scanSub = FlutterBluePlus.onScanResults.listen((results) {
      for (final r in results) {
        final id = r.device.remoteId.str;
        final advName = r.advertisementData.advName;
        final platformName = r.device.platformName;
        if (advName.isNotEmpty) {
          _nameCache[id] = advName;
        } else if (platformName.isNotEmpty && !_nameCache.containsKey(id)) {
          _nameCache[id] = platformName;
        }
      }
      if (mounted) setState(() => _results = results);
    });

    try {
      await FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 10),
        androidUsesFineLocation: false,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _isScanning = false);
    }
  }

  Future<void> _stopScan() async {
    await FlutterBluePlus.stopScan();
    _scanSub?.cancel();
    if (mounted) setState(() => _isScanning = false);
  }

  String _rssiStrength(int rssi) {
    if (rssi >= -60) return '████';
    if (rssi >= -75) return '███░';
    if (rssi >= -90) return '██░░';
    return '█░░░';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    if (!_bluetoothSupported) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.bluetoothTitle)),
        body: _UnsupportedFeature(
          icon: Icons.bluetooth_disabled,
          message: l10n.bluetoothNotSupported,
        ),
      );
    }

    final hasBonded = _bondedDevices.isNotEmpty;
    final hasResults = _results.isNotEmpty;
    final showEmpty = !hasBonded && !hasResults && !_isScanning;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.bluetoothTitle),
        actions: [
          if (_isScanning)
            IconButton(
              icon: const Icon(Icons.stop_circle_outlined),
              tooltip: l10n.bluetoothStop,
              onPressed: _stopScan,
            ),
        ],
      ),
      body: Column(
        children: [
          if (!_adapterOn)
            _InfoBanner(
              message: l10n.bluetoothAdapterOff,
              color: theme.colorScheme.error,
              bgColor: theme.colorScheme.errorContainer,
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: (_isScanning || !_adapterOn) ? null : _startScan,
                icon: _isScanning
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.search),
                label: Text(
                  _isScanning ? l10n.bluetoothScanning : l10n.bluetoothScan,
                ),
              ),
            ),
          ),
          Expanded(
            child: showEmpty
                ? _EmptyState(isScanning: false, l10n: l10n, theme: theme)
                : ListView(
                    padding: const EdgeInsets.only(bottom: 16),
                    children: [
                      // ── Paired Devices (Android only) ──────────────────
                      if (hasBonded) ...[
                        _SectionHeader(label: l10n.bluetoothPairedDevices),
                        ..._bondedDevices.map(
                          (d) => _BondedTile(
                            device: d,
                            name: _nameCache[d.remoteId.str] ??
                                (d.platformName.isNotEmpty
                                    ? d.platformName
                                    : l10n.bluetoothDeviceUnknown),
                            connectedLabel: l10n.bluetoothConnected,
                            theme: theme,
                          ),
                        ),
                      ],

                      // ── Nearby Devices (scan results) ──────────────────
                      if (_isScanning || hasResults) ...[
                        _SectionHeader(
                          label: l10n.bluetoothNearbyDevices,
                          count: hasResults ? _results.length : null,
                        ),
                        if (_isScanning && !hasResults)
                          _EmptyState(
                            isScanning: true,
                            l10n: l10n,
                            theme: theme,
                          ),
                        ..._results.map(
                          (r) => _ScanResultTile(
                            result: r,
                            name: _nameCache[r.device.remoteId.str] ??
                                l10n.bluetoothDeviceUnknown,
                            rssiStrength: _rssiStrength(r.rssi),
                            theme: theme,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label, this.count});

  final String label;
  final int? count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Bonded device tile ────────────────────────────────────────────────────────

class _BondedTile extends StatelessWidget {
  const _BondedTile({
    required this.device,
    required this.name,
    required this.connectedLabel,
    required this.theme,
  });

  final BluetoothDevice device;
  final String name;
  final String connectedLabel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final isConnected = device.isConnected;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Card(
        child: ListTile(
          leading: Icon(
            isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
            color: isConnected
                ? Colors.green
                : theme.colorScheme.primary,
          ),
          title: Text(name),
          subtitle: Text(
            device.remoteId.str,
            style: theme.textTheme.bodySmall,
          ),
          trailing: isConnected
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    connectedLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Icon(
                  Icons.link,
                  size: 18,
                  color: theme.colorScheme.outline,
                ),
        ),
      ),
    );
  }
}

// ── Scan result tile ──────────────────────────────────────────────────────────

class _ScanResultTile extends StatelessWidget {
  const _ScanResultTile({
    required this.result,
    required this.name,
    required this.rssiStrength,
    required this.theme,
  });

  final ScanResult result;
  final String name;
  final String rssiStrength;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Card(
        child: ListTile(
          leading: Icon(Icons.bluetooth, color: theme.colorScheme.primary),
          title: Text(name),
          subtitle: Text(
            result.device.remoteId.str,
            style: theme.textTheme.bodySmall,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${result.rssi} dBm', style: theme.textTheme.labelSmall),
              Text(
                rssiStrength,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Empty / scanning state ────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.isScanning,
    required this.l10n,
    required this.theme,
  });

  final bool isScanning;
  final AppLocalizations l10n;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isScanning ? Icons.bluetooth_searching : Icons.bluetooth,
            size: 64,
            color: theme.colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            isScanning ? l10n.bluetoothScanning : l10n.bluetoothNoDevices,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Info banner ───────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({
    required this.message,
    required this.color,
    required this.bgColor,
  });

  final String message;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(Icons.bluetooth_disabled, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Unsupported platform ──────────────────────────────────────────────────────

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
