import 'package:flutter/material.dart';
import 'package:e_market/designs/popup.dart';

class TextBox extends StatefulWidget {
  @override
  final String hint;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  final Function func;


  const TextBox({
    this.controller,
    this.hint,
    this.icon,
    this.type,
    this.func});

  _TextBoxState createState() => _TextBoxState();

  String getInfo()
  {
    return controller.text;
  }
}

class _TextBoxState extends State<TextBox> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    dynamic result;

    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange[500]),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange[500]),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        suffixIcon: Icon(
          widget.icon,
          color: Colors.orange[500],
        ),
      ),
      keyboardType: widget.type,
      maxLines: 1,

      onChanged: (text)
      {
        result = widget.func(text);
        if(result != null)
          {
            PopUp(data: queryData, icon: Icons.error_outline,
                title: 'ERROR', message: result,
                context: context);
            setState(() {
              widget.controller.text = "";
            });
          }

      },
    );

  }
}


