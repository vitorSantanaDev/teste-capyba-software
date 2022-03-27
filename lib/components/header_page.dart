//package
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  String text;
  HeaderPage({Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: unnecessary_this
      child: Text(this.text, style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold
              ),
            ),
      margin: const EdgeInsets.only(bottom: 24),
    );
  }
}