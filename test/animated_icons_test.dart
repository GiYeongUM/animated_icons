import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icon_animated/icon_animated.dart';

void main() {
  Widget host(bool active, {IconType type = IconType.check}) => MaterialApp(
    home: Center(
      child: IconAnimated(active: active, size: 48, iconType: type),
    ),
  );

  testWidgets(
    'animates activation, reversal, and disposal without leaking tickers',
    (tester) async {
      await tester.pumpWidget(host(false));
      expect(tester.hasRunningAnimations, isFalse);
      await tester.pumpWidget(host(true));
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.hasRunningAnimations, isTrue);
      await tester.pumpAndSettle();
      expect(tester.hasRunningAnimations, isFalse);
      await tester.pumpWidget(host(false));
      await tester.pump(const Duration(milliseconds: 100));
      expect(tester.hasRunningAnimations, isTrue);
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      expect(tester.takeException(), isNull);
      expect(tester.hasRunningAnimations, isFalse);
    },
  );

  testWidgets(
    'renders every icon and does not restart on an unrelated rebuild',
    (tester) async {
      for (final type in IconType.values) {
        await tester.pumpWidget(host(true, type: type));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
      await tester.pumpWidget(host(true));
      expect(tester.hasRunningAnimations, isFalse);
    },
  );
}
