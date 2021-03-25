import 'package:flutter/material.dart';

TextEditingController _nameController = TextEditingController();
bool secure = true;

class PassField extends StatefulWidget {
  @override
  final String hint;
  const PassField({this.hint});

  String getInfo()
  {
    return _nameController.text;
  }

  _PassFieldState createState() => _PassFieldState();

}

class _PassFieldState extends State<PassField> {
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
    );
  }
}
