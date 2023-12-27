import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrolling_simulator/ui/screens/achievement_screen.dart';
import 'package:scrolling_simulator/ui/screens/nav/root_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Scrolling Simulator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootScreen(
          child: AchievementScreen(),
        ));
  }
}
