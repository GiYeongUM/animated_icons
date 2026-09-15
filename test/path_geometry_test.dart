import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animated/icon_animated.dart';
import 'package:icon_animated/src/rendering/path_geometry.dart';

double length(Path path) =>
    path.computeMetrics().fold(0, (sum, metric) => sum + metric.length);

void main() {
  test('partial paths stop at the requested contour distance', () {
    final path = Path()
      ..lineTo(10, 0)
      ..moveTo(0, 10)
      ..lineTo(10, 10);
    final metrics = path.computeMetrics().toList();
    expect(length(extractContours(metrics, 0)), 0);
    expect(length(extractContours(metrics, 5)), closeTo(5, .001));
    expect(length(extractContours(metrics, 15)), closeTo(15, .001));
    expect(length(extractContours(metrics, 100)), closeTo(20, .001));
  });
  test('geometry follows actual size and reuses equal layouts', () {
    final geometry = PathGeometry()..update(IconType.check, const Size(24, 24));
    final small = geometry.extract(1).getBounds();
    geometry.update(IconType.check, const Size(48, 48));
    final large = geometry.extract(1).getBounds();
    expect(large.width, closeTo(small.width * 2, .001));
    geometry.update(IconType.check, const Size(48, 48));
    expect(geometry.extract(1).getBounds(), large);
    expect(geometry.extract(-1).computeMetrics(), isEmpty);
  });
}
