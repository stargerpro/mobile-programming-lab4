import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavHome());
  }
}

class NavHome extends StatelessWidget {
  const NavHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 9')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BottomNavScreen())),
              child: const Text('9.1 Bottom navigation'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TopTabsScreen())),
              child: const Text('9.2 Top tabs'),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Exercise 9.1 ----------
class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0; // selected tab

  final List<Widget> pages = const [
    Center(child: Text('Home', style: TextStyle(fontSize: 28))),
    Center(child: Text('Search', style: TextStyle(fontSize: 28))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 28))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom navigation')),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class TopTabsScreen extends StatelessWidget {
  const TopTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top tabs'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chats'),
              Tab(icon: Icon(Icons.circle_outlined), text: 'Status'),
              Tab(icon: Icon(Icons.call), text: 'Calls'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Chats', style: TextStyle(fontSize: 28))),
            Center(child: Text('Status', style: TextStyle(fontSize: 28))),
            Center(child: Text('Calls', style: TextStyle(fontSize: 28))),
          ],
        ),
      ),
    );
  }
}