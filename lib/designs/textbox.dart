import 'package:flutter/material.dart';

TextEditingController _nameController = TextEditingController();

class TextBox extends StatefulWidget {
  @override
  final String hint;
  final IconData icon;
  final TextInputType type;

  const TextBox({this.hint,this.icon,this.type});

  _TextBoxState createState() => _TextBoxState();

  String getInfo()
  {
    return _nameController.text;
  }
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
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


