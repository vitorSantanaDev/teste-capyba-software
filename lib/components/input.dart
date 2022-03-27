//package
import 'package:flutter/material.dart';

class TextFormFieldComponent extends StatefulWidget {
  String labeltext;
  TextEditingController controller;
  bool obscureText;
  TextInputType keyBoardType;
  Icon? prefixIcon;
  bool autoFocus;


  TextFormFieldComponent({
    Key? key, 
    required this.labeltext, 
    required this.controller,
    required this.obscureText,
    required this.keyBoardType,
    required this.autoFocus,
    this.prefixIcon
  }) : super(key: key);

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 24),
        child: TextFormField(
              controller: widget.controller,
              obscureText: widget.obscureText,
              keyboardType: widget.keyBoardType,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.labeltext,
                prefixIcon: widget.prefixIcon,
              ),
              validator: (value) {
                if(value!.isEmpty) {
                  return 'Por favor insira um valor válido';
                } else {
                  return null;
                }
              },
              onChanged: (value) => {},
            ),
      );
  }
}