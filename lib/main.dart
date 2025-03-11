import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'EXERCISE-2/models/color_counters.dart';
import 'EXERCISE-2/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Scaffold(body: SafeArea(child: MyWidget())),
        home: Home(),
      ),
    ),
  );
}
