import 'package:flutter/material.dart';
import 'package:icon_animated/icon_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool active = true;

  @override
  void initState() {
    active = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: InkWell(
          onTap: () {
            setState(() {
              active = !active;
            });
          },
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children: IconType.values.asMap().entries.map((iconType) => Container(
              color: Colors.black.withOpacity(0.05),
              child: Center(
                child: IconAnimated(
                  color: Colors.black,
                  active: active,
                  size: 100,
                  iconType: iconType.value,
                ),
              ),
            ),).toList(),
          ),
        ),
      ),
    );
  }
}
