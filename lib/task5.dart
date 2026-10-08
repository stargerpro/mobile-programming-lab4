import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DialogScreen(),
    );
  }
}

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  String status = 'Item exists';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(status, style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context : context,
                  builder : (ctx) {
                    return AlertDialog(
                      title: const Text('Delete item?'),
                      content: const Text('This cannot be undone.'),
                      actions: [ 
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                          },
                          child : const Text('Cancel'),
                        ),
                        TextButton(
                        onPressed: () {
                          setState(() {
                            status = 'Item deleted';
                          });
                          Navigator.pop(ctx);
                        },
                          child: const Text('Delete')
                        ),
                      ]
                    );
                  }
                );
              },
              child: const Text('Delete item'),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context : context,
                  builder : (ctx) {
                    return Column(
                      mainAxisSize : MainAxisSize.min,
                      children: [
                        ListTile(
                        leading : const Icon(Icons.link),
                        title: const Text('Copy link'),
                        onTap: () {
                          Navigator.pop(ctx);
                        },
                        ),
                        ListTile(
                          leading : const Icon(Icons.email),
                          title: const Text('Email'),
                          onTap: () {
                            Navigator.pop(ctx);
                          },
                        ),
                        ListTile(
                          leading : const Icon(Icons.message),
                          title: const Text('Message'),
                          onTap: () {
                            Navigator.pop(ctx);
                          }
                        )
                        
                 
                        
                      ]
                    );
                  }
                );
              },
              child: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}