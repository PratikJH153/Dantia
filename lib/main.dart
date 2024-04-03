import "package:dantia/views/onboard.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Dantia",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: OnboardPage(),
    );
  }
}
