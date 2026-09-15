import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animated/icon_animated.dart';

void main() {
  Widget host(bool active, {IconType type = IconType.check}) => MaterialApp(
    home: Center(
      child: IconAnimated(active: active, size: 48, iconType: type),
    ),
  );

  testWidgets(
    'animates activation, reversal, and disposal without leaking tickers',
    (tester) async {
      await tester.pumpWidget(host(false));
      expect(tester.hasRunningAnimations, isFalse);
      await tester.pumpWidget(host(true));
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.hasRunningAnimations, isTrue);
      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, isFalse);
      await tester.pumpWidget(host(false));
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.hasRunningAnimations, isTrue);
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      expect(tester.takeException(), isNull);
      expect(tester.hasRunningAnimations, isFalse);
    },
  );

  testWidgets(
    'renders every icon and does not restart on an unrelated rebuild',
    (tester) async {
      for (final type in IconType.values) {
        await tester.pumpWidget(host(true, type: type));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
      await tester.pumpWidget(host(true));
      expect(tester.hasRunningAnimations, isFalse);
    },
  );

  final animation = AlwaysStoppedAnimation<double>(1);
  AnimatedPathPainter painter({Color color = Colors.red}) =>
      AnimatedPathPainter(
        animation,
        color,
        2,
        IconType.check,
        const Size(48, 48),
      );

  test('only repaints when visual inputs change', () {
    expect(painter().shouldRepaint(painter()), isFalse);
    expect(painter(color: Colors.blue).shouldRepaint(painter()), isTrue);
  });

  test('partial multi-contour paths stop at the requested distance', () {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(10, 0)
      ..moveTo(0, 10)
      ..lineTo(10, 10);
    double length(Path path) =>
        path.computeMetrics().fold(0.0, (sum, metric) => sum + metric.length);
    expect(length(painter().createAnimatedPath(path, 0)), 0);
    expect(length(painter().createAnimatedPath(path, 0.25)), closeTo(5, 0.001));
    expect(
      length(painter().createAnimatedPath(path, 0.75)),
      closeTo(15, 0.001),
    );
    expect(length(painter().createAnimatedPath(path, 2)), closeTo(20, 0.001));
    expect(length(painter().createAnimatedPath(path, -1)), 0);
  });
}
