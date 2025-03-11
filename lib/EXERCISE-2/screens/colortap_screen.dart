import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cards.dart';
import '../models/color_counters.dart';
import '../widgets/colortap.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('ColorTapsScreen build');
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: Consumer<ColorCounters>(
        builder: (context, colorCounters, child) {
          return Column(
            children: [
              ColorTap(
                type: CardType.red,
                tapCount: colorCounters.redTapCount,
                onTap: colorCounters.incrementRedTapCount,
              ),
              ColorTap(
                type: CardType.blue,
                tapCount: colorCounters.blueTapCount,
                onTap: colorCounters.incrementBlueTapCount,
              ),
            ],
          );
        },
      ),
    );
  }
}
