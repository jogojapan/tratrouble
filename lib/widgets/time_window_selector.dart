import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated/l10n.dart';

class TimeWindowSelector extends StatelessWidget {
  final int durationMinutes;
  final int offsetMinutes;
  final ValueChanged<int> onDurationChanged;
  final ValueChanged<int> onOffsetChanged;

  const TimeWindowSelector({
    super.key,
    required this.durationMinutes,
    required this.offsetMinutes,
    required this.onDurationChanged,
    required this.onOffsetChanged,
  });

  static const int totalMinutes = 120; // 2 hours total

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now();
    final timeFormat = DateFormat('HH:mm');

    // Calculate start of highlighted window
    final centerMinute = totalMinutes ~/ 2 + offsetMinutes;
    final startMinute = centerMinute - durationMinutes ~/ 2;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Labels above timeline
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(''),
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).now,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
              ),
            ),
            Text(''),
          ],
        ),
        // Timeline with highlight
        SizedBox(
          height: 60,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final pixelsPerMinute = width / totalMinutes;

              return Stack(
                children: [
                  // Base line
                  Positioned(
                    top: 20,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: theme.dividerColor),
                  ),
                  // Highlighted window
                  Positioned(
                    top: 16,
                    left: pixelsPerMinute * startMinute,
                    width: pixelsPerMinute * durationMinutes,
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        final deltaMinutes =
                            (details.delta.dx / pixelsPerMinute).round();
                        final newOffset = (offsetMinutes + deltaMinutes).clamp(
                          -totalMinutes ~/ 2,
                          totalMinutes ~/ 2,
                        );
                        onOffsetChanged(newOffset);
                      },
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  // Center mark
                  Positioned(
                    top: 10,
                    left: width / 2 - 1,
                    child: Container(
                      width: 2,
                      height: 20,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  // Current time below
                  Positioned(
                    top: 40,
                    left: width / 2 - 30, // shifted left by 10 more pixels
                    width: 60, // increased width by 20 pixels
                    child: Center(
                      child: Text(
                        timeFormat.format(now),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Buttons below
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onOffsetChanged(offsetMinutes - 5),
                  child: const Icon(Icons.arrow_left, size: 40),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onDurationChanged(
                    (durationMinutes - 5).clamp(1, totalMinutes),
                  ),
                  child: const Icon(Icons.remove, size: 40),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onDurationChanged(
                    (durationMinutes + 5).clamp(1, totalMinutes),
                  ),
                  child: const Icon(Icons.add, size: 40),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onOffsetChanged(offsetMinutes + 5),
                  child: const Icon(Icons.arrow_right, size: 40),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Modify onDurationChanged calls to only extend/reduce right end
// So we need to adjust offsetMinutes accordingly
// We'll add a helper method to handle this

extension TimeWindowSelectorExtension on TimeWindowSelector {
  void extendWindowRight(int newDuration) {
    final leftStart =
        TimeWindowSelector.totalMinutes ~/ 2 +
        offsetMinutes -
        durationMinutes ~/ 2;
    final newOffset = leftStart + (durationMinutes - newDuration) ~/ 2;
    onOffsetChanged(newOffset);
    onDurationChanged(newDuration);
  }
}

// But since we can't call extension methods from widget directly, we will handle this in the parent widget
// So in DepartureScreen, we will adjust the onDurationChanged callback accordingly
