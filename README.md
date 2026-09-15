# icon_animated

Animated outline icons for Flutter. Toggle `active` to draw or reverse an icon.

## Installation

Requires Flutter 3.32+ and Dart 3.8+.
The pub.dev package name is **icon_animated**.

```sh
flutter pub add icon_animated
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:icon_animated/icon_animated.dart';

IconAnimated(
  active: isActive,
  size: 48,
  color: Colors.green,
  strokeWidth: 2,
  iconType: IconType.check,
)
```

Update `isActive` with `setState` or your preferred state management.
The forward and reverse transitions take 700 milliseconds.
The default stroke width is 4% of the icon size.

Supported icons: check, fail, alert, error, trendingUp, trendingDown, search,
message, add, download, menu, sort, bluetooth, and filter.

Wrap meaningful icons in a Semantics widget with an appropriate label.

![Animated icons](https://github.com/GiYeongUM/animated_icons/raw/main/images/custom_animated_icons.gif)

## Development

```sh
flutter pub get
dart format --output=none --set-exit-if-changed lib example test
flutter analyze --fatal-infos
flutter test
flutter pub publish --dry-run
```

CI checks the minimum supported Flutter version and the latest stable channel.

## Migration

This release requires Dart 3.8 and Flutter 3.32 or newer. Existing constructor
and method arguments remain supported. See [CHANGELOG.md](CHANGELOG.md) for fixes.

## License

MIT. See [LICENSE](LICENSE).
