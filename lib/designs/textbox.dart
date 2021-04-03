import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  @override
  final String hint;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;


  const TextBox({
    this.controller,
    this.hint,
    this.icon,
    this.type});

  _TextBoxState createState() => _TextBoxState();

  String getInfo()
  {
    return controller.text;
  }
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange[500]),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange[800]),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        suffixIcon: Icon(
          widget.icon,
          color: Colors.orange[500],
        ),
      ),
      keyboardType: widget.type,
      maxLines: 1,
    );
  }
}


