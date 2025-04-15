import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar Demo',
      theme: ThemeData(useMaterial3: true),
      home: const CustomAppBarScreen(),
    );
  }
}

class CustomAppBarScreen extends StatelessWidget {
  const CustomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 4,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/logo.png', // Place your logo in assets and update pubspec.yaml
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'HealthSync',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search tapped')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu tapped')),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to HealthSync!'),
      ),
    );
  }
}
