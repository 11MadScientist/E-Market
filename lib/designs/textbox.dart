import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  @override
  final String hint;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  final FocusNode node;
  final Function func_a;
  Function func_b;
  Function use;
  dynamic result;


   TextBox({
    this.controller,
    this.hint,
    this.icon,
    this.type,
    this.node,
    this.func_a,
    this.func_b});

  _TextBoxState createState() => _TextBoxState();

  bool isValidated = false;
  var _formKey = GlobalKey<FormState>();

  //getting the information
  String getInfo()
  {
    return controller.text;
  }

  //validating
  validator()async
  {
    use = func_a;
    result = await use(getInfo());
    return _formKey.currentState.validate();
  }

  verify()async
  {
    if(!validation())
      return;
    use = func_b;
    result = await use(getInfo());
    return _formKey.currentState.validate();
  }
  //verifies' email's availability

  //returning validation value
  bool validation()
  {
    return isValidated;
  }


}

class _TextBoxState extends State<TextBox> {


  @override
  void initState() {
    super.initState();
    if(widget.node != null)
    {
      widget.node.addListener(()async {
        {
          if(widget.node.hasFocus == false
              && widget.validation() == true
              && widget.func_b != null)
          {
            await widget.verify();
            // widget.use = widget.func_b;
            // widget.result = await widget.use(widget.getInfo());
            // return widget._formKey.currentState.validate();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Form(
        key: widget._formKey,
        child: TextFormField(
          controller: widget.controller,
          focusNode: widget.node,
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
            if(widget.result != null)
              {
                widget.isValidated = false;
                return widget.result;
              }
            widget.isValidated = true;
            widget.use = widget.func_a;
            return null;

          },
          onChanged: (text)async
          {
           await widget.validator();
          },

        ),
      ),
    );

  }
}


