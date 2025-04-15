import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      home: const NumberListScreen(),
    );
  }
}//new try

class NumberListScreen extends StatelessWidget {
  const NumberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate a list of numbers from 1 to 100
    final List<int> items = List<int>.generate(100, (i) => i + 1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${items[index]}'),
          );
        },
      ),
    );
  }
}
