import 'dart:ui';
import '../icon_type.dart';
import 'status_paths.dart';
import 'trends_paths.dart';
import 'actions_paths.dart';
import 'message_paths.dart';
import 'download_paths.dart';
import 'bluetooth_paths.dart';
import 'controls_paths.dart';

/// Constructs geometry only when an icon's type or allocated size changes.
Path createIconPath(IconType type, Size size) => switch (type) {
  IconType.check => checkPath(size),
  IconType.fail => failPath(size),
  IconType.alert => alertPath(size),
  IconType.error => errorPath(size),
  IconType.trendingUp => trendingUpPath(size),
  IconType.trendingDown => trendingDownPath(size),
  IconType.search => searchPath(size),
  IconType.message => messagePath(size),
  IconType.add => addPath(size),
  IconType.download => downloadPath(size),
  IconType.bluetooth => bluetoothPath(size),
  IconType.menu => menuPath(size),
  IconType.sort => sortPath(size),
  IconType.filter => filterPath(size),
};
