import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'VAGUS',
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    );
  }
}