import 'dart:ui';

Path searchPath(Size size) => Path()
  ..addOval(
    Rect.fromCircle(
      center: Offset(0.46 * size.width, 0.46 * size.height),
      radius: (size.width + size.height) / 12,
    ),
  )
  ..moveTo(0.56 * size.width, 0.56 * size.height)
  ..lineTo(0.70 * size.width, 0.70 * size.height);

Path addPath(Size size) => Path()
  ..moveTo(0.32 * size.width, 0.50 * size.height)
  ..lineTo(0.68 * size.width, 0.50 * size.height)
  ..moveTo(0.50 * size.width, 0.32 * size.height)
  ..lineTo(0.50 * size.width, 0.68 * size.height);
