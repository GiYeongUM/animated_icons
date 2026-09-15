import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animated/icon_animated.dart';
import 'package:icon_animated/src/rendering/animated_icon_painter.dart';
import 'package:icon_animated/src/rendering/path_geometry.dart';

void main() {
  test(
    'painting stays inside the allocated box, even with a thick stroke',
    () async {
      final recorder = ui.PictureRecorder();
      final painter = AnimatedIconPainter(
        animation: const AlwaysStoppedAnimation(1),
        color: Colors.red,
        strokeWidth: 20,
        iconType: IconType.check,
        geometry: PathGeometry(),
      );
      painter.paint(Canvas(recorder), const Size(24, 24));
      final picture = recorder.endRecording();
      final image = await picture.toImage(48, 48);
      final pixels = (await image.toByteData(
        format: ui.ImageByteFormat.rawRgba,
      ))!;
      var inside = 0;
      for (var y = 0; y < 48; y++) {
        for (var x = 0; x < 48; x++) {
          final alpha = pixels.getUint8((y * 48 + x) * 4 + 3);
          if (x >= 24 || y >= 24) {
            expect(alpha, 0, reason: 'Paint escaped at ($x, $y)');
          } else {
            inside += alpha;
          }
        }
      }
      expect(inside, greaterThan(0));
      image.dispose();
      picture.dispose();
    },
  );

  testWidgets('inherits icon color and respects reduced motion and semantics', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(disableAnimations: true),
          child: const IconTheme(
            data: IconThemeData(color: Colors.purple),
            child: Center(
              child: IconAnimated(
                active: true,
                size: 48,
                iconType: IconType.check,
                semanticLabel: 'Saved',
              ),
            ),
          ),
        ),
      ),
    );
    final paint = tester.widget<CustomPaint>(
      find.byWidgetPredicate(
        (widget) =>
            widget is CustomPaint && widget.painter is AnimatedIconPainter,
      ),
    );
    final painter = paint.painter! as AnimatedIconPainter;
    expect(painter.color, Colors.purple);
    expect(painter.animation.value, 1);
    expect(tester.hasRunningAnimations, isFalse);
    expect(find.bySemanticsLabel('Saved'), findsOneWidget);
    semantics.dispose();
  });
}
