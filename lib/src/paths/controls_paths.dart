import 'dart:ui';

Path menuPath(Size size) => Path()
  ..moveTo(0.28 * size.width, 0.38 * size.height)
  ..lineTo(0.68 * size.width, 0.38 * size.height)
  ..moveTo(0.28 * size.width, 0.50 * size.height)
  ..lineTo(0.68 * size.width, 0.50 * size.height)
  ..moveTo(0.28 * size.width, 0.62 * size.height)
  ..lineTo(0.68 * size.width, 0.62 * size.height);

Path sortPath(Size size) => Path()
  ..moveTo(0.28 * size.width, 0.38 * size.height)
  ..lineTo(0.68 * size.width, 0.38 * size.height)
  ..moveTo(0.28 * size.width, 0.50 * size.height)
  ..lineTo(0.58 * size.width, 0.50 * size.height)
  ..moveTo(0.28 * size.width, 0.62 * size.height)
  ..lineTo(0.44 * size.width, 0.62 * size.height);

Path filterPath(Size size) => Path()
  ..moveTo(0.29 * size.width, 0.36 * size.height)
  ..lineTo(0.52 * size.width, 0.36 * size.height)
  ..moveTo(0.595 * size.width, 0.36 * size.height)
  ..lineTo(0.70 * size.width, 0.36 * size.height)
  ..moveTo(0.29 * size.width, 0.50 * size.height)
  ..lineTo(0.43 * size.width, 0.50 * size.height)
  ..moveTo(0.48 * size.width, 0.50 * size.height)
  ..lineTo(0.70 * size.width, 0.50 * size.height)
  ..moveTo(0.29 * size.width, 0.64 * size.height)
  ..lineTo(0.43 * size.width, 0.64 * size.height)
  ..moveTo(0.50 * size.width, 0.64 * size.height)
  ..lineTo(0.70 * size.width, 0.64 * size.height)
  ..moveTo(0.595 * size.width, 0.29 * size.height)
  ..lineTo(0.595 * size.width, 0.43 * size.height)
  ..moveTo(0.41 * size.width, 0.43 * size.height)
  ..lineTo(0.41 * size.width, 0.57 * size.height)
  ..moveTo(0.50 * size.width, 0.57 * size.height)
  ..lineTo(0.50 * size.width, 0.71 * size.height);
