import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipeable List',
      theme: ThemeData(useMaterial3: true),
      home: const SwipeListScreen(),
    );
  }
}

class SwipeListScreen extends StatefulWidget {
  const SwipeListScreen({super.key});

  @override
  State<SwipeListScreen> createState() => _SwipeListScreenState();
}

class _SwipeListScreenState extends State<SwipeListScreen> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item deleted')),
    );
  }

  void _editItem(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${items[index]} (not implemented)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe to Delete/Edit')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _editItem(index);
                return false; // prevent actual dismissal for edit
              } else if (direction == DismissDirection.endToStart) {
                return await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: const Text('Are you sure you want to delete this item?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
                      TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Delete')),
                    ],
                  ),
                );
              }
              return false;
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                _deleteItem(index);
              }
            },
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
