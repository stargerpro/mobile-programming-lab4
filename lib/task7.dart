import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListScreen());
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<String> items = List.generate(20,(i) => 'Item ${i+1}');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body : ListView.builder(
      itemCount:  items.length,
      itemBuilder: (context,index) {
        final item = items[index];
        return Dismissible(
          key : ValueKey(item),
          background: Container(
          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: const Icon(Icons.delete, color: Colors.white),
          ),
        onDismissed: (direction) {
          setState(()
          {
            items.removeAt(index);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$item removed')),
          );
        },
        child: ListTile(
          leading: const Icon(Icons.label),
          title: Text(item),

        ),
        );
      },

      )
    );
  }
}