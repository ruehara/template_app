import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class BiometricPage extends StatefulWidget {
  const BiometricPage({super.key});

  @override
  State<BiometricPage> createState() => _BiometricPageState();
}

class _BiometricPageState extends State<BiometricPage> {
  final LocalAuthentication _auth = LocalAuthentication();

  bool? _isAvailable;
  bool? _isAuthenticated;
  List<BiometricType> _availableTypes = [];
  String? _statusMessage;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _checkCapabilities();
  }

  Future<void> _checkCapabilities() async {
    try {
      final canCheck = await _auth.canCheckBiometrics;
      final isDeviceSupported = await _auth.isDeviceSupported();
      final types = await _auth.getAvailableBiometrics();
      if (!mounted) return;
      setState(() {
        _isAvailable = canCheck && isDeviceSupported;
        _availableTypes = types;
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _isAvailable = false;
        _statusMessage = context.l10n.biometricErrorCheck(e.message ?? '');
      });
    }
  }

  Future<void> _authenticate() async {
    if (_isAvailable != true) return;
    final l10n = context.l10n;
    final localizedReason = l10n.biometricAuthReason;
    setState(() {
      _loading = true;
      _isAuthenticated = null;
      _statusMessage = l10n.biometricWaiting;
    });
    try {
      final authenticated = await _auth.authenticate(
        localizedReason: localizedReason,
      );
      if (!mounted) return;
      setState(() {
        _isAuthenticated = authenticated;
        _statusMessage = authenticated
            ? context.l10n.biometricSuccess
            : context.l10n.biometricCancelled;
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _isAuthenticated = false;
        _statusMessage = context.l10n.biometricAuthError(e.message ?? '');
      });
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _biometricLabel(BiometricType type, AppLocalizations l10n) {
    return switch (type) {
      BiometricType.face => l10n.biometricFaceId,
      BiometricType.fingerprint => l10n.biometricFingerprint,
      BiometricType.iris => l10n.biometricIris,
      BiometricType.strong => l10n.biometricStrong,
      BiometricType.weak => l10n.biometricWeak,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final resultColor = switch (_isAuthenticated) {
      true => Colors.green,
      false => Colors.red,
      null => theme.colorScheme.primary,
    };

    return Scaffold(
      appBar: AppBar(title: Text(l10n.biometricTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: Icon(
                  switch (_isAuthenticated) {
                    true => Icons.check_circle_outline,
                    false => Icons.cancel_outlined,
                    null => Icons.fingerprint,
                  },
                  key: ValueKey(_isAuthenticated),
                  size: 88,
                  color: resultColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                _statusMessage ?? l10n.biometricTapToTest,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: resultColor),
              ),
              const SizedBox(height: 32),
              if (_isAvailable == false)
                _InfoCard(
                  icon: Icons.info_outline,
                  message: l10n.biometricUnavailable,
                  color: theme.colorScheme.error,
                )
              else if (_availableTypes.isNotEmpty) ...[
                Text(
                  l10n.biometricAvailableTypes,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _availableTypes
                      .map((t) => Chip(label: Text(_biometricLabel(t, l10n))))
                      .toList(),
                ),
              ],
              const SizedBox(height: 40),
              FilledButton.icon(
                onPressed: _loading || _isAvailable == false
                    ? null
                    : _authenticate,
                icon: _loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.lock_open_outlined),
                label: Text(l10n.biometricAuthButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.message,
    required this.color,
  });

  final IconData icon;
  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }
}
