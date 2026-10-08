// TASK 8 SOLUTION: GridView.count + fullscreen preview
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: GalleryScreen());
  }
}

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<Color> colors = const [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(colors.length, (i) {          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PreviewScreen(color: colors[i], index: i),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  '${i + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class PreviewScreen extends StatelessWidget {
  final Color color;
  final int index;
  const PreviewScreen({super.key, required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: Text('Photo ${index + 1}')),
      body: const Center(
        child: Icon(Icons.image, size: 120, color: Colors.white),
      ),
    );
  }
}