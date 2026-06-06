import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class GeolocationPage extends StatefulWidget {
  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  Position? _position;
  bool _loading = false;
  String? _error;

  Future<void> _getLocation() async {
    setState(() {
      _loading = true;
      _error = null;
      _position = null;
    });

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          setState(() => _error = context.l10n.geolocationServiceDisabled);
        }
        return;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            setState(() => _error = context.l10n.geolocationPermissionDenied);
          }
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          setState(
            () => _error = context.l10n.geolocationPermissionDeniedForever,
          );
        }
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      if (mounted) setState(() => _position = pos);
    } catch (e) {
      if (mounted) {
        setState(() => _error = context.l10n.geolocationError(e.toString()));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.geolocationTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: _position != null
                    ? const Icon(
                        Icons.location_on,
                        key: ValueKey('on'),
                        size: 72,
                        color: Colors.green,
                      )
                    : _error != null
                        ? Icon(
                            Icons.location_off,
                            key: const ValueKey('off'),
                            size: 72,
                            color: theme.colorScheme.error,
                          )
                        : Icon(
                            Icons.location_searching,
                            key: const ValueKey('idle'),
                            size: 72,
                            color: theme.colorScheme.primary,
                          ),
              ),
              const SizedBox(height: 24),
              if (_error != null)
                Card(
                  color: theme.colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(_error!)),
                      ],
                    ),
                  ),
                )
              else if (_position != null)
                _PositionCard(position: _position!)
              else
                Text(
                  l10n.geolocationWaiting,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              const SizedBox(height: 40),
              FilledButton.icon(
                onPressed: _loading ? null : _getLocation,
                icon: _loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.my_location),
                label: Text(
                  _loading
                      ? l10n.geolocationLoading
                      : l10n.geolocationGetPosition,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PositionCard extends StatelessWidget {
  const _PositionCard({required this.position});

  final Position position;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _DataRow(
              label: l10n.geolocationLatitude,
              value: position.latitude.toStringAsFixed(6),
            ),
            const Divider(height: 16),
            _DataRow(
              label: l10n.geolocationLongitude,
              value: position.longitude.toStringAsFixed(6),
            ),
            const Divider(height: 16),
            _DataRow(
              label: l10n.geolocationAltitude,
              value: '${position.altitude.toStringAsFixed(1)} m',
            ),
            const Divider(height: 16),
            _DataRow(
              label: l10n.geolocationAccuracy,
              value: '±${position.accuracy.toStringAsFixed(1)} m',
            ),
            const Divider(height: 16),
            _DataRow(
              label: l10n.geolocationSpeed,
              value: '${position.speed.toStringAsFixed(1)} m/s',
            ),
          ],
        ),
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
