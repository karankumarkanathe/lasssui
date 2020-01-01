

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.black,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

