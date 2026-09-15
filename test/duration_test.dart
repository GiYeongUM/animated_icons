import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animated/icon_animated.dart';
import 'package:icon_animated/src/rendering/animated_icon_painter.dart';

void main() {
  Widget host({required bool active, required Duration duration}) =>
      MaterialApp(
        home: Center(
          child: IconAnimated(
            active: active,
            size: 48,
            iconType: IconType.check,
            duration: duration,
            curve: Curves.linear,
          ),
        ),
      );

  double progress(WidgetTester tester) {
    final paint = tester.widget<CustomPaint>(
      find.byWidgetPredicate(
        (widget) =>
            widget is CustomPaint && widget.painter is AnimatedIconPainter,
      ),
    );
    return (paint.painter! as AnimatedIconPainter).animation.value;
  }

  testWidgets('custom duration controls both drawing and reversal', (
    tester,
  ) async {
    const duration = Duration(seconds: 2);
    await tester.pumpWidget(host(active: true, duration: duration));
    await tester.pump(const Duration(milliseconds: 500));
    expect(progress(tester), closeTo(0.25, 0.001));
    await tester.pump(const Duration(milliseconds: 1500));
    expect(progress(tester), 1);
    await tester.pump(const Duration(milliseconds: 1));
    expect(tester.hasRunningAnimations, isFalse);

    await tester.pumpWidget(host(active: false, duration: duration));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(progress(tester), closeTo(0.75, 0.001));
    await tester.pump(const Duration(milliseconds: 1500));
    expect(progress(tester), 0);
    await tester.pump(const Duration(milliseconds: 1));
    expect(tester.hasRunningAnimations, isFalse);
  });

  testWidgets('duration changes apply without resetting progress', (
    tester,
  ) async {
    await tester.pumpWidget(
      host(active: true, duration: const Duration(seconds: 2)),
    );
    await tester.pump(const Duration(milliseconds: 500));
    expect(progress(tester), closeTo(0.25, 0.001));
    await tester.pumpWidget(
      host(active: true, duration: const Duration(seconds: 1)),
    );
    expect(progress(tester), closeTo(0.25, 0.001));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 375));
    expect(progress(tester), closeTo(0.625, 0.001));
    await tester.pump(const Duration(milliseconds: 375));
    expect(progress(tester), 1);
    await tester.pump(const Duration(milliseconds: 1));
    expect(tester.hasRunningAnimations, isFalse);
  });

  testWidgets('zero duration immediately follows active without a ticker', (
    tester,
  ) async {
    for (final active in [true, false, true]) {
      await tester.pumpWidget(host(active: active, duration: Duration.zero));
      expect(progress(tester), active ? 1 : 0);
      expect(tester.hasRunningAnimations, isFalse);
    }
  });
}
