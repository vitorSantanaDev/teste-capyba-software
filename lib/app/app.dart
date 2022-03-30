//package
import 'package:flutter/material.dart';

//pages
import 'package:teste_capyba/pages/login_page.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(0, 233, 99, 1),
        brightness: Brightness.dark
      ),
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}