import 'package:flutter/material.dart';

void main() => runApp(ImageGridApp());

class ImageGridApp extends StatelessWidget {
  const ImageGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Grid',
      home: ImageGridScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imageUrls = List.generate(
    12,
    (index) => 'https://picsum.photos/200/300?random=${index + 1}',
  );

  ImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Grid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        
      ),
    );
  }
}
