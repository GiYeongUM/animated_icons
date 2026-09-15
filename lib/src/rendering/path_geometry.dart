import 'dart:ui';
import '../icon_type.dart';
import '../paths/icon_path.dart';

/// Caches the path and its measured contours for the current layout.
final class PathGeometry {
  IconType? _type;
  Size? _size;
  List<PathMetric> _metrics = const [];
  double _length = 0;

  void update(IconType type, Size size) {
    if (type == _type && size == _size) return;
    _type = type;
    _size = size;
    _metrics = createIconPath(
      type,
      size,
    ).computeMetrics().toList(growable: false);
    _length = _metrics.fold(0, (sum, metric) => sum + metric.length);
  }

  Path extract(double progress) =>
      extractContours(_metrics, _length * progress.clamp(0, 1));
}

/// Extracts a distance across multiple contours without remeasuring the path.
Path extractContours(Iterable<PathMetric> metrics, double length) {
  final path = Path();
  var remaining = length;
  for (final metric in metrics) {
    if (remaining <= 0) break;
    final end = remaining.clamp(0.0, metric.length);
    path.addPath(metric.extractPath(0, end), Offset.zero);
    remaining -= end;
  }
  return path;
}
