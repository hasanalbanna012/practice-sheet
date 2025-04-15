import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Demo',
      theme: ThemeData(useMaterial3: true),
      home: const AnimatedContainerScreen(),
    );
  }
}

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({super.key});

  @override
  State<AnimatedContainerScreen> createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _changeContainer() {
    final random = Random();

    setState(() {
      _width = random.nextDouble() * 200 + 50; // Width between 50–250
      _height = random.nextDouble() * 200 + 50; // Height between 50–250
      _color = Color.fromRGBO(
        random.nextInt(256), 
        random.nextInt(256), 
        random.nextInt(256), 
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextDouble() * 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeContainer,
              child: const Text('Animate!'),
            ),
          ],
        ),
      ),
    );
  }
}
