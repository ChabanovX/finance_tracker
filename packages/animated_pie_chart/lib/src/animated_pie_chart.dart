import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// Domain‑level value object – no dependency leakage.
class PieChartItem {
  const PieChartItem(this.label, this.value, {required this.color});

  final String label;
  final double value;
  final Color color;
}

/// Animated donut‑style pie chart.
///
/// * Expands to the square height of whatever space its parent gives it.
/// * Rotates 360° & cross‑fades when its data ([items]) changes.
/// * Tapping a slice shows a tooltip badge with the value.
/// * A dot‑and‑label legend sits to **the right** of the chart.
class AnimatedPieChart extends StatefulWidget {
  const AnimatedPieChart({
    super.key,
    required this.items,
    this.duration = const Duration(milliseconds: 1000),
  });

  final List<PieChartItem> items;
  final Duration duration;

  @override
  State<AnimatedPieChart> createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart>
    with SingleTickerProviderStateMixin {
  // ── animation controller ───────────────────────────────────────────────────
  late final AnimationController _ctrl =
      AnimationController(vsync: this, duration: widget.duration)
        ..addStatusListener((s) {
          if (s == AnimationStatus.completed) {
            if (_next != null) _current = _next!;
            _next = null;
            _ctrl.reset();
          }
        });

  late List<PieChartItem> _current = widget.items;
  List<PieChartItem>? _next;

  // Index of the slice being touched (‑1 means none).
  int _touchedIndex = -1;

  @override
  void didUpdateWidget(covariant AnimatedPieChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _next = widget.items;
      _ctrl.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Reserve ~60‑70 % of the width for the chart, the rest for the legend.
        final chartSide = math.min(
          constraints.maxHeight,
          constraints.maxWidth * 0.65,
        );

        final holeRadius = chartSide * 0.28;
        final sectionRadius = chartSide * 0.27;

        return AnimatedBuilder(
          animation: _ctrl,
          builder: (context, child) {
            final t = _ctrl.value; // 0 → 1
            final angle = t * 2 * math.pi; // rotation 0° → 360°

            // Choose dataset & opacity phase during cross‑fade.
            final firstHalf = t < 0.5 || _next == null;
            final items = firstHalf ? _current : _next!;
            final opacity =
                (firstHalf ? 1 - t * 2 : t * 2 - 1).clamp(0.0, 1.0);

            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── donut chart ────────────────────────────────────────────
                SizedBox(
                  width: chartSide,
                  height: chartSide,
                  child: Transform.rotate(
                    angle: angle,
                    child: Opacity(
                      opacity: opacity,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: holeRadius,
                          sections: _toSections(items, sectionRadius),
                          pieTouchData: PieTouchData(
                            enabled: true,
                            touchCallback: (event, resp) {
                              if (!event.isInterestedForInteractions ||
                                  resp == null ||
                                  resp.touchedSection == null) {
                                setState(() => _touchedIndex = -1);
                              } else {
                                setState(() => _touchedIndex =
                                    resp.touchedSection!.touchedSectionIndex);
                              }
                            },
                          ),
                          sectionsSpace: 1,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // ── legend ────────────────────────────────────────────────
                Flexible(child: _Legend(items: items)),
              ],
            );
          },
        );
      },
    );
  }

  // ── helper ────────────────────────────────────────────────────────────────
  List<PieChartSectionData> _toSections(
      List<PieChartItem> src, double radius) {
    return src.asMap().entries.map((entry) {
      final i = entry.key;
      final item = entry.value;
      final bool isTouched = i == _touchedIndex;

      return PieChartSectionData(
        value: item.value,
        color: item.color,
        // We purposely hide labels on the chart surface.
        title: '',
        showTitle: false,
        radius: radius,
        // Tooltip badge using fl_chart ≥ 1.0 badge API
        badgeWidget: isTouched
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                constraints: const BoxConstraints(maxWidth: 100),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${item.label}: ${item.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            : null,
        badgePositionPercentageOffset: 1.2,
      );
    }).toList();
  }
}

// ── legend widget ───────────────────────────────────────────────────────────
class _Legend extends StatelessWidget {
  const _Legend({required this.items});

  final List<PieChartItem> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: item.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      item.label,
                      style: const TextStyle(fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
