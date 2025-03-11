import 'package:flutter/material.dart';
import 'statistic_screen.dart';
import 'colortap_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  // Create static instances of screens to prevent rebuilding
  final List<Widget> _screens = [
    const ColorTapsScreen(),
    const StatisticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print('Home build');
    return Scaffold(
      // Use IndexedStack to maintain state and prevent rebuilds
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}
