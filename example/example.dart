import 'package:animated_icons/animated_icons.dart';
import 'package:flutter/material.dart';


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
      home: const MyHomePage(title: 'Widget Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late  bool isOn;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    isOn = false;
    _showIcon();
    super.initState();
  }

  void _showIcon() {
    _animationController.forward();
    setState(() {
      isOn = true;
    });
  }

  void _reverseIcon() {
    _animationController.reverse();
    setState(() {
      isOn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: InkWell(
          onTap: (){
            isOn ? _reverseIcon() : _showIcon();
          },
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children:  <Widget>[
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.green,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.check,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.red,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.fail,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.black,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.alert,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.green,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.trendingUp,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.red,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.trendingDown,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.black,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.search,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.blue,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.download,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.blue,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.message,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.black,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.plus,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.blue,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.bluetooth,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.03),
                child: IconAnimated(
                  color: Colors.black,
                  progress: _animation,
                  size: 100,
                  iconType: IconType.menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
