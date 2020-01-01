import 'package:flutter/material.dart';
import 'package:vagus_ui/src/login_module/screen/login_screen.dart';

void main() => runApp(VagusApp());

class VagusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}