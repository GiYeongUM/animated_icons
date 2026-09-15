import 'package:flutter/material.dart';
import 'package:icon_animated/icon_animated.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Animated icons',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.dark,
      ),
    ),
    home: const ExamplePage(),
  );
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});
  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool _active = true;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Animated icons')),
    body: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final type in IconType.values)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconAnimated(
                    active: _active,
                    size: 64,
                    iconType: type,
                    semanticLabel: type.name,
                  ),
                  Text(type.name),
                ],
              ),
          ],
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () => setState(() => _active = !_active),
          child: const Text('Toggle icons'),
        ),
      ],
    ),
  );
}
