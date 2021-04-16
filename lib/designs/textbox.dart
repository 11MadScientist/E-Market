import 'dart:html';

import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  @override
  final String hint;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  final Function func;

   TextBox({
    this.controller,
    this.hint,
    this.icon,
    this.type,
    this.func});

  _TextBoxState createState() => _TextBoxState();

  bool isValidated = false;
  var _formKey = GlobalKey<FormState>();

  //getting the information
  String getInfo()
  {
    return controller.text;
  }

  //validating
  validator()
  {
    return _formKey.currentState.validate();
  }

  //returning validation value
  bool validation()
  {
    return isValidated;
  }


}

class _TextBoxState extends State<TextBox> {

  @override
  Widget build(BuildContext context) {

    return Form(
      key: widget._formKey,
      child: TextFormField(
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

          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[500]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[500]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          suffixIcon: Icon(
            widget.icon,
            color: Colors.orange[500],
          ),
        ),
        keyboardType: widget.type,
        maxLines: 1,

        validator: (text)
        {
          dynamic result = widget.func(text);
          if(result != null)
            {
              widget.isValidated = false;
              return result;
            }
         widget.isValidated = true;
          return null;

        },
        onChanged: (text)
        {
          widget.validator();
        },
      ),
    );

  }
}


