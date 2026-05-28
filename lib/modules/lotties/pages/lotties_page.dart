import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class LottiesPage extends StatefulWidget {
  const LottiesPage({super.key});

  @override
  State<LottiesPage> createState() => _LottiesPageState();
}

class _LottiesPageState extends State<LottiesPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _playing = true;
  double _speed = 1.0;
  Duration? _baseDuration;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayback() {
    setState(() => _playing = !_playing);
    if (_playing && _controller.duration != null) {
      _controller.repeat();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    final animations = [
      _AnimationItem(
        name: l10n.lottiesAnimLoading,
        asset: 'assets/lotties/loading.json',
        icon: Icons.hourglass_empty,
      ),
      _AnimationItem(
        name: l10n.lottiesAnimSuccess,
        asset: 'assets/lotties/success.json',
        icon: Icons.check_circle_outline,
      ),
      _AnimationItem(
        name: l10n.lottiesAnimError,
        asset: 'assets/lotties/error.json',
        icon: Icons.error_outline,
      ),
    ];

    final current = animations[_selectedIndex];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.lottiesTitle)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: animations.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final item = animations[i];
                  final selected = i == _selectedIndex;
                  return ChoiceChip(
                    avatar: Icon(item.icon, size: 16),
                    label: Text(item.name),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        _selectedIndex = i;
                        _playing = true;
                        _baseDuration = null;
                        _speed = 1.0;
                      });
                      _controller.reset();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Lottie.asset(
                  current.asset,
                  controller: _controller,
                  onLoaded: (composition) {
                    _baseDuration = composition.duration;
                    _controller
                      ..duration = Duration(
                        milliseconds:
                            (composition.duration.inMilliseconds / _speed)
                                .round(),
                      )
                      ..repeat();
                  },
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stack) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.animation, size: 80, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        l10n.lottiesNoAssets,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.lottiesSpeed(_speed.toStringAsFixed(1)),
              style: theme.textTheme.labelMedium,
            ),
            Slider(
              value: _speed,
              min: 0.25,
              max: 3.0,
              divisions: 11,
              label: '${_speed.toStringAsFixed(2)}x',
              onChanged: (v) {
                setState(() => _speed = v);
                if (_baseDuration != null) {
                  _controller.duration = Duration(
                    milliseconds:
                        (_baseDuration!.inMilliseconds / v).round(),
                  );
                }
              },
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: _togglePlayback,
                  icon: Icon(_playing ? Icons.pause : Icons.play_arrow),
                  label: Text(_playing ? l10n.lottiesPause : l10n.lottiesPlay),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    _controller.reset();
                    if (_playing && _controller.duration != null) {
                      _controller.repeat();
                    }
                  },
                  icon: const Icon(Icons.replay),
                  label: Text(l10n.lottiesRestart),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _AnimationItem {
  const _AnimationItem({
    required this.name,
    required this.asset,
    required this.icon,
  });

  final String name;
  final String asset;
  final IconData icon;
}
