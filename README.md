# animated_icons
Flutter animated icons

[![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## Icon lists

- check
- fail
- alert
- trendingUp
- trendingDown
- search
- message
- plus
- download
- menu
- bluetooth

## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


```yaml
dependencies:
  animated_icons: ^<latest_version>
```

## 📷 GIF

<img width="308" alt="" src="https://github.com/GiYeongUM/animated_icons/raw/main/images/custom_animated_icons.gif">


## 💪 Use

1. Set animation
``` dart
class _FooClassState extends State<FooClass> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState()  {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));
    super.initState();
  }

  void _showIcon() {
    _animationController.forward();
  }
  
  ...
```

2. add widget
``` dart
IconAnimated(
  color: Colors.green,
  progress: _animation,
  size: 100,
  iconType: IconType.check,
),
```

3. trigger widget animation
``` dart
_showIcon()

/// If you want to do the reverse
/// do this
/// _animationController.reverse();
```