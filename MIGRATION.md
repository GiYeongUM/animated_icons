# Migrating to icon_animated 2.0

[← README](README.md) · [Release history](CHANGELOG.md)

Flutter 3.32 and Dart 3.8 remain the minimum supported versions. Update the dependency
to `icon_animated: ^2.0.0`, apply the changes below, then run `flutter analyze` and your
application's tests.

## What changes

The usual `IconAnimated(active: ..., size: ..., iconType: ...)` call still works.

| 1.x                                           | 2.0                               |
| --------------------------------------------- | --------------------------------- |
| Public IconAnimatedState                      | Private implementation state      |
| Exported AnimatedPathPainter and path helpers | Internal rendering implementation |
| Default theme.primaryColor                    | Ambient IconTheme color           |
| Drawing based on requested size               | Drawing based on allocated size   |

Use widget properties to control the icon. Code that instantiated the old painter or
referenced its State type must move to the supported widget API. Imports from `src/` are
not part of the supported public API.

## Optional additions

```dart
IconAnimated(
  active: isSaved,
  size: 48,
  iconType: IconType.check,
  duration: const Duration(milliseconds: 250),
  curve: Curves.easeOut,
  semanticLabel: 'Saved',
)
```

## Verification checklist

- Check light and dark themes with your app's color scheme.
- Check large text and narrow layouts.
- Check right-to-left layouts where applicable.
- Check screen-reader labels and reduced-motion behavior.
- Run application tests after updating call sites.
