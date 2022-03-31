//package
import 'package:flutter/material.dart';

//components
import 'package:teste_capyba/components/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color.fromRGBO(0, 233, 99, 1),
        centerTitle: true,
      ),
      body: const FormLoginApp(),
    );
  }
}
