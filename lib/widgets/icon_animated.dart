import 'dart:ui';

import 'package:flutter/material.dart';

enum IconType {
  check,
  fail,
  alert,
  trendingUp,
  trendingDown,
  search,
  message,
  plus,
  download,
  menu,
  bluetooth,
}

class IconAnimated extends StatefulWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;
  final double? strokeWidth;
  final IconType iconType;

  const IconAnimated(
      {Key? key,
      required this.progress,
      required this.size,
      this.color,
      this.strokeWidth,
      required this.iconType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => IconAnimatedState();
}

class IconAnimatedState extends State<IconAnimated>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    switch (widget.iconType) {
      case IconType.check:
        return CustomPaint(
            foregroundPainter: AnimatedCheckPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.fail:
        return CustomPaint(
            foregroundPainter: AnimatedClosePathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.alert:
        return CustomPaint(
            foregroundPainter: AnimatedAlertPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.trendingUp:
        return CustomPaint(
            foregroundPainter: AnimateTrendingUpPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.trendingDown:
        return CustomPaint(
            foregroundPainter: AnimateTrendingDownPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.search:
        return CustomPaint(
            foregroundPainter: AnimateSearchPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.message:
        return CustomPaint(
            foregroundPainter: AnimateMessagePathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.plus:
        return CustomPaint(
            foregroundPainter: AnimatePlusPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.download:
        return CustomPaint(
            foregroundPainter: AnimateDownloadPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.menu:
        return CustomPaint(
            foregroundPainter: AnimateMenuPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
      case IconType.bluetooth:
        return CustomPaint(
            foregroundPainter: AnimateBluetoothPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
    }
  }
}

class AnimatedCheckPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatedCheckPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.27083 * size.width, 0.54167 * size.height)
      ..lineTo(0.41667 * size.width, 0.68750 * size.height)
      ..lineTo(0.75000 * size.width, 0.35417 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedClosePathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatedClosePathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.7 * size.width, 0.3 * size.height)
      ..lineTo(0.3 * size.width, 0.7 * size.height)
      ..moveTo(0.3 * size.width, 0.3 * size.height)
      ..lineTo(0.7 * size.width, 0.7 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatedAlertPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatedAlertPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
        center: Offset(0.5 * size.width, 0.5 * size.height),
        radius: (size.width + size.height) / 7.5,
      ))
      ..moveTo(0.5 * size.width, 0.34 * size.height)
      ..lineTo(0.5 * size.width, 0.55 * size.height)
      ..moveTo(0.5 * size.width, 0.61 * size.height)
      ..lineTo(0.5 * size.width, 0.66 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateTrendingUpPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateTrendingUpPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.28 * size.width, 0.62 * size.height)
      ..lineTo(0.43 * size.width, 0.47 * size.height)
      ..lineTo(0.53 * size.width, 0.57 * size.height)
      ..lineTo(0.72 * size.width, 0.38 * size.height)
      ..moveTo(0.745 * size.width, 0.38 * size.height)
      ..lineTo(0.60 * size.width, 0.38 * size.height)
      ..moveTo(0.72 * size.width, 0.38 * size.height)
      ..lineTo(0.72 * size.width, 0.50 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateTrendingDownPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateTrendingDownPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.25 * size.width, 0.35 * size.height)
      ..lineTo(0.415 * size.width, 0.525 * size.height)
      ..lineTo(0.515 * size.width, 0.405 * size.height)
      ..lineTo(0.700 * size.width, 0.600 * size.height)
      ..moveTo(0.735 * size.width, 0.615 * size.height)
      ..lineTo(0.585 * size.width, 0.615 * size.height)
      ..moveTo(0.715 * size.width, 0.635 * size.height)
      ..lineTo(0.715 * size.width, 0.475 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateSearchPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateSearchPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
        center: Offset(0.46 * size.width, 0.46 * size.height),
        radius: (size.width + size.height) / 12,
      ))
      ..moveTo(0.56 * size.width, 0.56 * size.height)
      ..lineTo(0.70 * size.width, 0.70 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateMessagePathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateMessagePathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.68 * size.width, 0.50 * size.height)
      ..quadraticBezierTo(0.68 * size.width, 0.50 * size.height,
          0.67 * size.width, 0.475 * size.height)
      ..quadraticBezierTo(0.67 * size.width, 0.475 * size.height,
          0.65 * size.width, 0.46 * size.height)
      ..lineTo(0.39 * size.width, 0.33 * size.height)
      ..quadraticBezierTo(0.39 * size.width, 0.33 * size.height,
          0.36 * size.width, 0.32 * size.height)
      ..quadraticBezierTo(0.36 * size.width, 0.32 * size.height,
          0.33 * size.width, 0.33 * size.height)
      ..quadraticBezierTo(0.33 * size.width, 0.33 * size.height,
          0.32 * size.width, 0.35 * size.height)
      ..quadraticBezierTo(0.32 * size.width, 0.35 * size.height,
          0.32 * size.width, 0.37 * size.height)
      ..lineTo(0.375 * size.width, 0.50 * size.height)
      ..lineTo(0.32 * size.width, 0.625 * size.height)
      ..quadraticBezierTo(0.32 * size.width, 0.625 * size.height,
          0.32 * size.width, 0.645 * size.height)
      ..quadraticBezierTo(0.32 * size.width, 0.645 * size.height,
          0.33 * size.width, 0.665 * size.height)
      ..quadraticBezierTo(0.33 * size.width, 0.665 * size.height,
          0.36 * size.width, 0.675 * size.height)
      ..quadraticBezierTo(0.36 * size.width, 0.675 * size.height,
          0.39 * size.width, 0.665 * size.height)
      ..lineTo(0.65 * size.width, 0.535 * size.height)
      ..quadraticBezierTo(0.65 * size.width, 0.535 * size.height,
          0.67 * size.width, 0.52 * size.height)
      ..quadraticBezierTo(0.67 * size.width, 0.52 * size.height,
          0.68 * size.width, 0.50 * size.height)
      ..quadraticBezierTo(0.68 * size.width, 0.50 * size.height,
          0.675 * size.width, 0.49 * size.height)
      ..moveTo(0.38 * size.width, 0.50 * size.height)
      ..lineTo(0.52 * size.width, 0.50 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimatePlusPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatePlusPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.32 * size.width, 0.50 * size.height)
      ..lineTo(0.68 * size.width, 0.50 * size.height)
      ..moveTo(0.50 * size.width, 0.32 * size.height)
      ..lineTo(0.50 * size.width, 0.68 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateDownloadPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateDownloadPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.42 * size.width, 0.46 * size.height)
      ..lineTo(0.37 * size.width, 0.46 * size.height)
      ..quadraticBezierTo(0.37 * size.width, 0.46 * size.height,
          0.36 * size.width, 0.465 * size.height)
      ..quadraticBezierTo(0.36 * size.width, 0.465 * size.height,
          0.35 * size.width, 0.47 * size.height)
      ..quadraticBezierTo(0.35 * size.width, 0.47 * size.height,
          0.345 * size.width, 0.48 * size.height)
      ..quadraticBezierTo(0.345 * size.width, 0.48 * size.height,
          0.34 * size.width, 0.49 * size.height)
      ..lineTo(0.34 * size.width, 0.65 * size.height)
      ..quadraticBezierTo(0.34 * size.width, 0.65 * size.height,
          0.345 * size.width, 0.66 * size.height)
      ..quadraticBezierTo(0.345 * size.width, 0.66 * size.height,
          0.35 * size.width, 0.67 * size.height)
      ..quadraticBezierTo(0.35 * size.width, 0.67 * size.height,
          0.36 * size.width, 0.675 * size.height)
      ..quadraticBezierTo(0.36 * size.width, 0.675 * size.height,
          0.37 * size.width, 0.68 * size.height)
      ..lineTo(0.63 * size.width, 0.68 * size.height)
      ..quadraticBezierTo(0.63 * size.width, 0.68 * size.height,
          0.64 * size.width, 0.675 * size.height)
      ..quadraticBezierTo(0.64 * size.width, 0.675 * size.height,
          0.65 * size.width, 0.67 * size.height)
      ..quadraticBezierTo(0.65 * size.width, 0.67 * size.height,
          0.655 * size.width, 0.66 * size.height)
      ..quadraticBezierTo(0.655 * size.width, 0.66 * size.height,
          0.66 * size.width, 0.65 * size.height)
      ..lineTo(0.66 * size.width, 0.49 * size.height)
      ..quadraticBezierTo(0.66 * size.width, 0.65 * size.height,
          0.655 * size.width, 0.48 * size.height)
      ..quadraticBezierTo(0.655 * size.width, 0.48 * size.height,
          0.65 * size.width, 0.47 * size.height)
      ..quadraticBezierTo(0.65 * size.width, 0.47 * size.height,
          0.64 * size.width, 0.465 * size.height)
      ..quadraticBezierTo(0.64 * size.width, 0.465 * size.height,
          0.63 * size.width, 0.46 * size.height)
      ..lineTo(0.58 * size.width, 0.46 * size.height)
      ..moveTo(0.50 * size.width, 0.32 * size.height)
      ..lineTo(0.50 * size.width, 0.60 * size.height)
      ..moveTo(0.42 * size.width, 0.54 * size.height)
      ..quadraticBezierTo(0.42 * size.width, 0.54 * size.height,
          0.50 * size.width, 0.60 * size.height)
      ..quadraticBezierTo(0.50 * size.width, 0.60 * size.height,
          0.58 * size.width, 0.54 * size.height);
    // ..moveTo(0.50 * size.width, 0.58 * size.height)
    // ..quadraticBezierTo(0.50 * size.width, 0.58 * size.height, 0.49 * size.width, 0.59 * size.height)
    // ..quadraticBezierTo(0.49 * size.width, 0.59 * size.height, 0.48 * size.width, 0.58 * size.height)
    // ..lineTo(0.42 * size.width, 0.54 * size.height)
    // ..moveTo(0.50 * size.width, 0.58 * size.height)
    // ..quadraticBezierTo(0.50 * size.width, 0.58 * size.height, 0.51 * size.width, 0.59 * size.height)
    // ..quadraticBezierTo(0.51 * size.width, 0.59 * size.height, 0.52 * size.width, 0.58 * size.height)
    // ..lineTo(0.58 * size.width, 0.54 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateMenuPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateMenuPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.32 * size.width, 0.38 * size.height)
      ..lineTo(0.68 * size.width, 0.38 * size.height)
      ..moveTo(0.32 * size.width, 0.50 * size.height)
      ..lineTo(0.68 * size.width, 0.50 * size.height)
      ..moveTo(0.32 * size.width, 0.62 * size.height)
      ..lineTo(0.68 * size.width, 0.62 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.05;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimateBluetoothPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimateBluetoothPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.39 * size.width, 0.61 * size.height)
      ..lineTo(0.60 * size.width, 0.40 * size.height)
      ..quadraticBezierTo(0.60 * size.width, 0.40 * size.height,
          0.61 * size.width, 0.39 * size.height)
      ..quadraticBezierTo(0.61 * size.width, 0.39 * size.height,
          0.60 * size.width, 0.38 * size.height)
      ..lineTo(0.52 * size.width, 0.30 * size.height)
      ..quadraticBezierTo(0.52 * size.width, 0.30 * size.height,
          0.51 * size.width, 0.29 * size.height)
      ..quadraticBezierTo(0.51 * size.width, 0.29 * size.height,
          0.50 * size.width, 0.28 * size.height)
      ..quadraticBezierTo(0.50 * size.width, 0.28 * size.height,
          0.50 * size.width, 0.29 * size.height)
      ..quadraticBezierTo(0.50 * size.width, 0.29 * size.height,
          0.50 * size.width, 0.30 * size.height)
      ..lineTo(0.50 * size.width, 0.70 * size.height)
      ..quadraticBezierTo(0.50 * size.width, 0.70 * size.height,
          0.50 * size.width, 0.71 * size.height)
      ..quadraticBezierTo(0.50 * size.width, 0.71 * size.height,
          0.50 * size.width, 0.72 * size.height)
      ..quadraticBezierTo(0.50 * size.width, 0.72 * size.height,
          0.51 * size.width, 0.71 * size.height)
      ..quadraticBezierTo(0.51 * size.width, 0.71 * size.height,
          0.52 * size.width, 0.70 * size.height)
      ..lineTo(0.60 * size.width, 0.62 * size.height)
      ..quadraticBezierTo(0.60 * size.width, 0.62 * size.height,
          0.61 * size.width, 0.61 * size.height)
      ..quadraticBezierTo(0.61 * size.width, 0.61 * size.height,
          0.60 * size.width, 0.60 * size.height)
      ..lineTo(0.39 * size.width, 0.39 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.04;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
