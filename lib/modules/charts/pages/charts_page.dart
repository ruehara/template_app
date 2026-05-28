import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:template_app/core/services/localization/l10n.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.chartsTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.chartsLine),
              Tab(text: l10n.chartsBars),
              Tab(text: l10n.chartsPie),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_LineChartTab(), _BarChartTab(), _PieChartTab()],
        ),
      ),
    );
  }
}

// ─── Line Chart ───────────────────────────────────────────────────────────────

class _LineChartTab extends StatelessWidget {
  const _LineChartTab();

  static const _spots = [
    FlSpot(0, 3.2),
    FlSpot(1, 5.1),
    FlSpot(2, 4.0),
    FlSpot(3, 6.8),
    FlSpot(4, 5.5),
    FlSpot(5, 7.2),
  ];

  List<String> _months(BuildContext context) {
    final l10n = context.l10n;
    return [l10n.monthJan, l10n.monthFeb, l10n.monthMar, l10n.monthApr, l10n.monthMay, l10n.monthJun];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;
    final months = _months(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.chartsMonthlySales, style: theme.textTheme.titleSmall),
          const SizedBox(height: 24),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: theme.colorScheme.outlineVariant,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (v, _) => Text(
                        '${v.toInt()}k',
                        style: theme.textTheme.labelSmall,
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (v, _) {
                        final i = v.toInt();
                        if (i < 0 || i >= months.length) {
                          return const SizedBox.shrink();
                        }
                        return Text(
                          months[i],
                          style: theme.textTheme.labelSmall,
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: _spots,
                    isCurved: true,
                    color: color,
                    barWidth: 3,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      color: color.withValues(alpha: 0.12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Bar Chart ────────────────────────────────────────────────────────────────

class _BarChartTab extends StatelessWidget {
  const _BarChartTab();

  static const _labels = ['Q1', 'Q2', 'Q3', 'Q4'];
  static const _values = [4.2, 6.1, 5.3, 8.0];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const color = Color(0xFF26A69A);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.chartsQuarterlyRevenue, style: theme.textTheme.titleSmall),
          const SizedBox(height: 24),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barTouchData: const BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (v, _) {
                        final i = v.toInt();
                        if (i < 0 || i >= _labels.length) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            _labels[i],
                            style: theme.textTheme.labelSmall,
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (v, _) => Text(
                        '${v.toStringAsFixed(0)}M',
                        style: theme.textTheme.labelSmall,
                      ),
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: theme.colorScheme.outlineVariant,
                    strokeWidth: 1,
                  ),
                ),
                barGroups: List.generate(
                  _values.length,
                  (i) => BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: _values[i],
                        color: color,
                        width: 28,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Pie Chart ────────────────────────────────────────────────────────────────

class _PieChartTab extends StatefulWidget {
  const _PieChartTab();

  @override
  State<_PieChartTab> createState() => _PieChartTabState();
}

class _PieChartTabState extends State<_PieChartTab> {
  int _touched = -1;

  List<({String label, double value, Color color})> _sections(BuildContext context) => [
    (label: 'Flutter', value: 40.0, color: const Color(0xFF42A5F5)),
    (label: 'React Native', value: 25.0, color: const Color(0xFF66BB6A)),
    (label: 'Ionic', value: 15.0, color: const Color(0xFFFF7043)),
    (label: context.l10n.chartsSectionOthers, value: 20.0, color: const Color(0xFFAB47BC)),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sections = _sections(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(context.l10n.chartsMobileShare, style: theme.textTheme.titleSmall),
          const SizedBox(height: 16),
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (event, response) {
                    if (!event.isInterestedForInteractions ||
                        response?.touchedSection == null) {
                      setState(() => _touched = -1);
                      return;
                    }
                    setState(
                      () => _touched =
                          response!.touchedSection!.touchedSectionIndex,
                    );
                  },
                ),
                sections: List.generate(sections.length, (i) {
                  final s = sections[i];
                  final isTouched = i == _touched;
                  return PieChartSectionData(
                    value: s.value,
                    color: s.color,
                    radius: isTouched ? 80 : 65,
                    title: '${s.value.toInt()}%',
                    titleStyle: TextStyle(
                      fontSize: isTouched ? 16 : 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }),
                sectionsSpace: 3,
                centerSpaceRadius: 40,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: sections
                .map(
                  (s) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: s.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(s.label, style: theme.textTheme.bodySmall),
                    ],
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
