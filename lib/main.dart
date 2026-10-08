import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = false; // true while the spinner should show

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: Center(
        // if loading, show the spinner, otherwise show the button
        child: isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  // 1. turn the spinner on
                  setState(() {
                    isLoading = true;
                  });

                  // 2. wait 3 seconds
                  await Future.delayed(const Duration(seconds: 3));

                  // 3. stop if the screen was closed while waiting
                  if (!mounted) return;

                  // 4. turn the spinner off
                  setState(() {
                    isLoading = false;
                  });

                  // 5. show the SnackBar with an Undo action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Done!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          print('Undone');
                        },
                      ),
                    ),
                  );
                },
                child: const Text('Start'),
              ),
      ),
    );
  }
}