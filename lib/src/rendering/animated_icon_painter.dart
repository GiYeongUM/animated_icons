import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import '../icon_type.dart';
import 'path_geometry.dart';

/// Internal delegate; geometry is owned by the widget state across rebuilds.
final class AnimatedIconPainter extends CustomPainter {
  AnimatedIconPainter({
    required this.animation,
    required this.color,
    required this.strokeWidth,
    required this.iconType,
    required this.geometry,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color color;
  final double? strokeWidth;
  final IconType iconType;
  final PathGeometry geometry;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;
    geometry.update(iconType, size);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? size.shortestSide * 0.04;
    canvas.save();
    canvas.clipRect(Offset.zero & size);
    canvas.drawPath(geometry.extract(animation.value), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant AnimatedIconPainter oldDelegate) =>
      animation != oldDelegate.animation ||
      color != oldDelegate.color ||
      strokeWidth != oldDelegate.strokeWidth ||
      iconType != oldDelegate.iconType ||
      geometry != oldDelegate.geometry;
}
