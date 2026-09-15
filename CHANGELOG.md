# Changelog

[← README](README.md) · [Migration guide](MIGRATION.md)

## 2.0.0

### Changed

- Split the entry point into explicit exports, widget, icon types, geometry, and
  rendering modules.
- Paint within the actual allocated size and clip oversized strokes.
- Cache path geometry and measured contours between frames.
- Add theme inheritance, semantic labels, configurable duration/curve, and
  reduced-motion support.

### Migration

- This major release intentionally changes public APIs; see
  [MIGRATION.md](MIGRATION.md).
- Minimum requirements remain Flutter 3.32 and Dart 3.8.

### Documentation

- Refresh examples, configuration tables, architecture notes, and migration
  instructions.

## 1.3.0

- Require Dart 3.8 and Flutter 3.32 or newer; adopt flutter_lints 6.
- Move animation control out of build and dispose animation listeners.
- Avoid unnecessary repaints and stop path extraction at the requested length.
- Replace the placeholder test with animation and path regression tests.

## 1.2.1

- add dispose

## 1.2.0

- animation logic has been inline

## 1.1.0

- add sort icon
- add filter icon

## 1.0.1

- add error icon
- clean code

## 1.0.0

- publish major version
- change alert icon

## 0.1.0+1

- clean code

## 0.1.0

- initial package

[Icon list]

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
