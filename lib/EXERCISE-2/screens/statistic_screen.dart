import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/color_counters.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('StatisticsScreen build');
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Consumer<ColorCounters>(
        builder: (context, colorCounters, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Red Taps: ${colorCounters.redTapCount}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  'Blue Taps: ${colorCounters.blueTapCount}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
