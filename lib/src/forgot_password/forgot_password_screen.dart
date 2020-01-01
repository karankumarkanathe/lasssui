import 'package:flutter/material.dart';
import 'package:vagus_ui/src/common_modules/rounded_button.dart';
import 'package:vagus_ui/src/common_modules/textfield_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  getEmailTextField(),
                  Divider(),
                  SizedBox(height: 20,),
                  Text('Reset password link will be sent to your registered email address.', textAlign:TextAlign.center)
                ],
              ),
              RoundedButton(
                title: 'Recover Password',
                onPressed: () {},
              ),
              getLoginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  FlatButton getLoginButton(BuildContext context) {
    return FlatButton(
      child: Text('Back to Login'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  CustomTextField getPasswordTextField() {
    return CustomTextField(
      hintText: 'Password',
      prefixIcon: Icons.security,
      isObscure: true,
    );
  }

  CustomTextField getEmailTextField() {
    return CustomTextField(
      hintText: 'Email',
      prefixIcon: Icons.email,
      isObscure: false,
      keyboardType: TextInputType.emailAddress,
    );
  }

    CustomTextField getPhoneNumberTextField() {
    return CustomTextField(
      hintText: 'Phone Number',
      prefixIcon: Icons.phone,
      isObscure: false,
      keyboardType: TextInputType.phone,
    );
  }
}