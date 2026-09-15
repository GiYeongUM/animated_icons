# icon_animated

Small outline icons. Smooth transitions. Native Flutter behavior.

[![pub package](https://img.shields.io/pub/v/icon_animated.svg)](https://pub.dev/packages/icon_animated)
[![CI](https://github.com/GiYeongUM/animated_icons/actions/workflows/ci.yml/badge.svg)](https://github.com/GiYeongUM/animated_icons/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

[Quick start](#quick-start) · [Configuration](#configuration) ·
[Example](example/example.dart) · [Migration](MIGRATION.md) · [Changelog](CHANGELOG.md)

## At a glance

- 14 built-in outline icons with forward and reverse animations.
- Uses the space allocated by the parent, including narrow layouts.
- Reuses path geometry between animation frames.
- Inherits IconTheme and supports semantic labels and reduced motion.

## Quick start

**Requirements:** Flutter **3.32+** · Dart **3.8+**

```sh
flutter pub add icon_animated
```

To use this major version explicitly:

```yaml
dependencies:
  icon_animated: ^2.0.0
```

```dart
import 'package:flutter/material.dart';
import 'package:icon_animated/icon_animated.dart';

IconAnimated(
  active: isSaved,
  size: 48,
  iconType: IconType.check,
  semanticLabel: 'Saved',
)
```

Here, `isSaved` is a boolean from your application state.

## Configuration

| Option        | Default              | Purpose                                                         |
| ------------- | -------------------- | --------------------------------------------------------------- |
| active        | required             | Draw the icon when true; reverse when false.                    |
| size          | required             | Preferred width and height; parent constraints take precedence. |
| iconType      | required             | One of the 14 IconType values.                                  |
| color         | IconTheme            | Optional icon color.                                            |
| strokeWidth   | 4% of shortest side  | Optional positive stroke width.                                 |
| duration      | 700 ms               | Animation duration; Duration.zero is immediate.                 |
| curve         | Curves.easeInOutCirc | Animation curve.                                                |
| semanticLabel | null                 | Accessible label; null marks a decorative icon.                 |

## Icon catalog

| Status                       | Actions                           | Navigation                       |
| ---------------------------- | --------------------------------- | -------------------------------- |
| check · fail · alert · error | search · message · add · download | menu · sort · filter · bluetooth |
| trendingUp · trendingDown    |                                   |                                  |

Change `active` using `setState` or your preferred state management. The widget owns and
disposes its animation controller.

## Package structure

```text
lib/
├── icon_animated.dart           # Public exports
└── src/
    ├── icon_animated.dart       # Widget and private lifecycle state
    ├── icon_type.dart           # Icon enumeration
    ├── paths/                  # Icon geometry grouped by purpose
    └── rendering/              # Cached metrics and paint delegate
```

Import the package entry point. Files under `src/` are implementation details and are
not a supported import surface.

## Development

```sh
flutter pub get
dart format --output=none --set-exit-if-changed lib example test
flutter analyze --fatal-infos
flutter test
flutter pub publish --dry-run
```

CI validates Flutter 3.32.0 and the latest stable channel. When switching SDK versions
locally, run `flutter clean` before testing to avoid reusing incompatible compiled
shader assets.

## Upgrading from 1.x

Version 2.0 includes intentional API changes. Follow [MIGRATION.md](MIGRATION.md) before
changing an existing application's dependency constraint.

## Support and license

Report reproducible issues in
[GitHub Issues](https://github.com/GiYeongUM/animated_icons/issues). Include the Flutter
version and a minimal example.

Released under the [MIT license](LICENSE).
