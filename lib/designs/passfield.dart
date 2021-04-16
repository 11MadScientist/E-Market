import 'package:flutter/material.dart';

TextEditingController _nameController = TextEditingController();
bool secure = true;

class PassField extends StatefulWidget {
  @override
  final String hint;
  final TextEditingController controller;
  final Function func;

  PassField({
    this.hint,
    this.controller,
    this.func});

  bool isValidated = false;
  var _formKey = GlobalKey<FormState>();

  _PassFieldState createState() => _PassFieldState();

  String getInfo()
  {
    return controller.text;
  }

  validator()
  {
    return _formKey.currentState.validate();
  }

  bool validation()
  {
    return isValidated;
  }

}

class _PassFieldState extends State<PassField> {

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
            borderSide: BorderSide(color: Colors.orange[800]),
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
          suffixIcon: IconButton(
            icon: Icon(
              secure ? Icons.security:Icons.remove_red_eye,
              color: Colors.orange[500],
            ),
            onPressed: ()
            {
              setState(() {
                secure = !secure;
              });
            },
          ),
        ),
        obscureText: secure,
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
