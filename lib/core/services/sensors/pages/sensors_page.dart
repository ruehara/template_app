import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:template_app/core/services/localization/l10n.dart';

bool get _sensorsSupported =>
    !kIsWeb && (Platform.isAndroid || Platform.isIOS || Platform.isMacOS);

class SensorsPage extends StatelessWidget {
  const SensorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.sensorsTitle),
          bottom: TabBar(
            tabs: [
              Tab(icon: const Icon(Icons.screen_rotation), text: l10n.sensorsAccelerometer),
              Tab(icon: const Icon(Icons.rotate_90_degrees_ccw), text: l10n.sensorsGyroscope),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _AccelerometerTab(),
            _GyroscopeTab(),
          ],
        ),
      ),
    );
  }
}

class _AccelerometerTab extends StatelessWidget {
  const _AccelerometerTab();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!_sensorsSupported) return _UnsupportedSensor(message: l10n.sensorsNotSupported);
    return StreamBuilder<AccelerometerEvent>(
      stream: accelerometerEventStream().handleError((_) {}),
      builder: (context, snapshot) {
        if (snapshot.hasError) return _UnsupportedSensor(message: l10n.sensorsNotSupported);
        final event = snapshot.data;
        return _SensorDisplay(
          icon: Icons.screen_rotation,
          title: l10n.sensorsAccelerometer,
          description: l10n.sensorsAccelerometerDesc,
          x: event?.x,
          y: event?.y,
          z: event?.z,
          maxValue: 20,
          color: const Color(0xFFFF7043),
        );
      },
    );
  }
}

class _GyroscopeTab extends StatelessWidget {
  const _GyroscopeTab();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!_sensorsSupported) return _UnsupportedSensor(message: l10n.sensorsNotSupported);
    return StreamBuilder<GyroscopeEvent>(
      stream: gyroscopeEventStream().handleError((_) {}),
      builder: (context, snapshot) {
        if (snapshot.hasError) return _UnsupportedSensor(message: l10n.sensorsNotSupported);
        final event = snapshot.data;
        return _SensorDisplay(
          icon: Icons.rotate_90_degrees_ccw,
          title: l10n.sensorsGyroscope,
          description: l10n.sensorsGyroscopeDesc,
          x: event?.x,
          y: event?.y,
          z: event?.z,
          maxValue: 10,
          color: const Color(0xFF42A5F5),
        );
      },
    );
  }
}

class _UnsupportedSensor extends StatelessWidget {
  const _UnsupportedSensor({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sensors_off, size: 48, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _SensorDisplay extends StatelessWidget {
  const _SensorDisplay({
    required this.icon,
    required this.title,
    required this.description,
    required this.x,
    required this.y,
    required this.z,
    required this.maxValue,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String description;
  final double? x;
  final double? y;
  final double? z;
  final double maxValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (x == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(context.l10n.sensorsWaiting, style: theme.textTheme.bodyMedium),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 32),
          _AxisBar(label: 'X', value: x!, maxValue: maxValue, color: color),
          const SizedBox(height: 20),
          _AxisBar(label: 'Y', value: y!, maxValue: maxValue, color: color),
          const SizedBox(height: 20),
          _AxisBar(label: 'Z', value: z!, maxValue: maxValue, color: color),
          const Spacer(),
          _VisualBall(x: x!, y: y!, color: color),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _AxisBar extends StatelessWidget {
  const _AxisBar({
    required this.label,
    required this.value,
    required this.maxValue,
    required this.color,
  });

  final String label;
  final double value;
  final double maxValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pct = (value.abs() / maxValue).clamp(0.0, 1.0);

    return Row(
      children: [
        SizedBox(
          width: 20,
          child: Text(
            label,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 14,
              color: color,
              backgroundColor: color.withValues(alpha: 0.15),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 60,
          child: Text(
            value.toStringAsFixed(2),
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class _VisualBall extends StatelessWidget {
  const _VisualBall({required this.x, required this.y, required this.color});

  final double x;
  final double y;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const size = 200.0;
    final dx = (x / 10).clamp(-1.0, 1.0) * (size / 2 - 20);
    final dy = (y / 10).clamp(-1.0, 1.0) * (size / 2 - 20);

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color.withValues(alpha: 0.4),
                  width: 2,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(dx, dy),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
