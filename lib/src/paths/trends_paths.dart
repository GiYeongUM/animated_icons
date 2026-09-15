import 'dart:ui';

Path trendingUpPath(Size size) => Path()
  ..moveTo(0.28 * size.width, 0.62 * size.height)
  ..lineTo(0.43 * size.width, 0.47 * size.height)
  ..lineTo(0.53 * size.width, 0.57 * size.height)
  ..lineTo(0.72 * size.width, 0.38 * size.height)
  ..moveTo(0.745 * size.width, 0.38 * size.height)
  ..lineTo(0.60 * size.width, 0.38 * size.height)
  ..moveTo(0.72 * size.width, 0.38 * size.height)
  ..lineTo(0.72 * size.width, 0.50 * size.height);

Path trendingDownPath(Size size) => Path()
  ..moveTo(0.25 * size.width, 0.35 * size.height)
  ..lineTo(0.415 * size.width, 0.525 * size.height)
  ..lineTo(0.515 * size.width, 0.405 * size.height)
  ..lineTo(0.700 * size.width, 0.600 * size.height)
  ..moveTo(0.735 * size.width, 0.615 * size.height)
  ..lineTo(0.585 * size.width, 0.615 * size.height)
  ..moveTo(0.715 * size.width, 0.635 * size.height)
  ..lineTo(0.715 * size.width, 0.475 * size.height);
