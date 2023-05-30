# icon_animated
Flutter animated icons

[![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## 📋 Icon lists

- check
- fail
- alert
- trendingUp
- trendingDown
- search
- message
- add
- download
- bluetooth
- menu
- sort
- filter

## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


```yaml
dependencies:
  animated_icons: ^<latest_version>
```

## 📷 GIF

<img width="308" alt="" src="https://github.com/GiYeongUM/animated_icons/raw/main/images/custom_animated_icons.gif">


## 💪 Use

1. add widget
``` dart
IconAnimated(
  color: Colors.green,
  active: isActive, // boolean
  size: 100,
  iconType: IconType.check,
),
```

2. just trigger widget
``` dart
setState(() {
  isActive = !isActive;
});
```

## 📋 Notice

This package can be used for commercial purposes. 
We're going to add a new icon every update. 
If you need any icons, send png or svg icon to **eomky2005@gmail.com** via email or **Git Issue**.
