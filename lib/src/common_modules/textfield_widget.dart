
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.hintText,
    this.prefixIcon,
    @required this.isObscure,
    this.keyboardType, this.errorText, this.onTextChanged,
  }) : super(key: key);

  final String hintText;
  final String errorText;
  final IconData prefixIcon;
  final bool isObscure;
  final TextInputType keyboardType;
  final Function onTextChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTextChanged,
      obscureText: isObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          hintText: hintText,
          errorText: errorText,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
          ),
          border: InputBorder.none),
    );
  }
}
