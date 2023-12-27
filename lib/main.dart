import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrolling_simulator/ui/screens/nav/router.dart';

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
    return MaterialApp.router(
      routerConfig: router,
      title: 'Scrolling Simulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
