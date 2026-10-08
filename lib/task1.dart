import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// The app itself. It remembers if dark mode is on.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: SettingsScreen(
        darkMode: darkMode,
        onDarkModeChanged: (newValue) {
          setState(() {
            darkMode = newValue;
          });
        },
      ),
    );
  }
}

// The settings screen. It receives darkMode from the app above.
class SettingsScreen extends StatefulWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const SettingsScreen({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: widget.darkMode,
            onChanged: widget.onDarkModeChanged,
          ),
          CheckboxListTile(
            title: const Text('Agree to Terms'),
            value: agreed,
            onChanged: (newValue) {
              setState(() {
                agreed = newValue ?? false;
              });
            },
          ),
          ElevatedButton(
            onPressed: agreed
                ? () {
                    print('Button pressed!');
                  }
                : null,
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}