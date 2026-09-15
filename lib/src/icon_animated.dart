import 'package:flutter/material.dart';
import 'icon_type.dart';
import 'rendering/animated_icon_painter.dart';
import 'rendering/path_geometry.dart';

/// Draws or reverses an outline icon, respecting layout and reduced motion.
class IconAnimated extends StatefulWidget {
  const IconAnimated({
    super.key,
    required this.active,
    required this.size,
    required this.iconType,
    this.color,
    this.strokeWidth,
    this.duration = const Duration(milliseconds: 700),
    this.curve = Curves.easeInOutCirc,
    this.semanticLabel,
  }) : assert(size > 0 && size < double.infinity),
       assert(
         strokeWidth == null ||
             (strokeWidth > 0 && strokeWidth < double.infinity),
       );

  final bool active;
  final double size;
  final IconType iconType;
  final Color? color;
  final double? strokeWidth;
  final Duration duration;
  final Curve curve;
  final String? semanticLabel;

  @override
  State<IconAnimated> createState() => _IconAnimatedState();
}

class _IconAnimatedState extends State<IconAnimated>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late CurvedAnimation _animation;
  final _geometry = PathGeometry();
  bool? _disableAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final disabled = MediaQuery.disableAnimationsOf(context);
    if (_disableAnimations != disabled) {
      _disableAnimations = disabled;
      _synchronizeAnimation();
    }
  }

  @override
  void didUpdateWidget(covariant IconAnimated oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = widget.duration;
    if (oldWidget.curve != widget.curve) {
      _animation.dispose();
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    }
    if (oldWidget.active != widget.active ||
        oldWidget.duration != widget.duration) {
      _synchronizeAnimation();
    }
  }

  void _synchronizeAnimation() {
    if (_disableAnimations == true || widget.duration == Duration.zero) {
      _controller.value = widget.active ? 1 : 0;
    } else if (widget.active) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) => Semantics(
    label: widget.semanticLabel,
    excludeSemantics: widget.semanticLabel == null,
    child: CustomPaint(
      size: Size.square(widget.size),
      painter: AnimatedIconPainter(
        animation: _animation,
        color:
            widget.color ??
            IconTheme.of(context).color ??
            Theme.of(context).colorScheme.onSurface,
        strokeWidth: widget.strokeWidth,
        iconType: widget.iconType,
        geometry: _geometry,
      ),
    ),
  );

  @override
  void dispose() {
    _animation.dispose();
    _controller.dispose();
    super.dispose();
  }
}
