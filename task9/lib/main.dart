import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card List',
      theme: ThemeData(useMaterial3: true),
      home: const CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  final List<Map<String, String>> data = const [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Card Title 1',
      'subtitle': 'Subtitle 1',
      'description': 'This is the description for card 1.',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Card Title 2',
      'subtitle': 'Subtitle 2',
      'description': 'This is the description for card 2.',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Card Title 3',
      'subtitle': 'Subtitle 3',
      'description': 'This is the description for card 3.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Cards')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return AnimatedCard(
            imageUrl: data[index]['image']!,
            title: data[index]['title']!,
            subtitle: data[index]['subtitle']!,
            description: data[index]['description']!,
          );
        },
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const AnimatedCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isTapped = true),
      onTapUp: (_) => setState(() => _isTapped = false),
      onTapCancel: () => setState(() => _isTapped = false),
      onTap: () {
        // Handle tap action if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on ${widget.title}')),
        );
      },//new try
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: _isTapped ? Colors.grey.shade400 : Colors.grey.shade200,
              blurRadius: _isTapped ? 10 : 6,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        transform: _isTapped
            ? (Matrix4.identity()..scale(0.98))
            : Matrix4.identity(),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(widget.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(widget.subtitle, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                  const SizedBox(height: 6),
                  Text(widget.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
