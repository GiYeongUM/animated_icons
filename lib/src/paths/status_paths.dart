import 'dart:ui';

Path checkPath(Size size) => Path()
  ..moveTo(0.27083 * size.width, 0.54167 * size.height)
  ..lineTo(0.41667 * size.width, 0.68750 * size.height)
  ..lineTo(0.75000 * size.width, 0.35417 * size.height);

Path failPath(Size size) => Path()
  ..moveTo(0.7 * size.width, 0.3 * size.height)
  ..lineTo(0.3 * size.width, 0.7 * size.height)
  ..moveTo(0.3 * size.width, 0.3 * size.height)
  ..lineTo(0.7 * size.width, 0.7 * size.height);

Path alertPath(Size size) => Path()
  ..addOval(
    Rect.fromCircle(
      center: Offset(0.5 * size.width, 0.5 * size.height),
      radius: (size.width + size.height) / 7.5,
    ),
  )
  ..moveTo(0.5 * size.width, 0.34 * size.height)
  ..lineTo(0.5 * size.width, 0.39 * size.height)
  ..moveTo(0.5 * size.width, 0.45 * size.height)
  ..lineTo(0.5 * size.width, 0.66 * size.height);

Path errorPath(Size size) => Path()
  ..addOval(
    Rect.fromCircle(
      center: Offset(0.5 * size.width, 0.5 * size.height),
      radius: (size.width + size.height) / 7.5,
    ),
  )
  ..moveTo(0.5 * size.width, 0.34 * size.height)
  ..lineTo(0.5 * size.width, 0.55 * size.height)
  ..moveTo(0.5 * size.width, 0.61 * size.height)
  ..lineTo(0.5 * size.width, 0.66 * size.height);
