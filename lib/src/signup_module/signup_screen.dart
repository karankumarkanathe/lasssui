import 'package:flutter/material.dart';
import 'package:vagus_ui/src/common_modules/logo_widget.dart';
import 'package:vagus_ui/src/common_modules/rounded_button.dart';
import 'package:vagus_ui/src/common_modules/textfield_widget.dart';
import 'package:vagus_ui/src/signup_module/bloc/bloc.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupBloc _signupBloc;

  @override
  void dispose() {
    super.dispose();
    _signupBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _signupBloc = SignupBloc();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new LogoWidget(),
                Column(
                  children: <Widget>[
                    getNameTextField(),
                    Divider(),
                    getEmailTextField(),
                    Divider(),
                    getPhoneNumberTextField(),
                    Divider(),
                    getPasswordTextField(),
                  ],
                ),
                StreamBuilder<bool>(
                    stream: _signupBloc.isValid,
                    builder: (context, snapshot) {
                      return RoundedButton(
                        title: 'Sign Up',
                        onPressed:
                            snapshot.hasData ? () => callSignupApi() : null,
                      );
                    }),
                getLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FlatButton getLoginButton(BuildContext context) {
    return FlatButton(
      child: Text('Already have an account? Login'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  StreamBuilder getPasswordTextField() {
    return StreamBuilder<String>(
        stream: _signupBloc.password,
        builder: (context, snapshot) {
          return CustomTextField(
            hintText: 'Password',
            prefixIcon: Icons.security,
            isObscure: true,
            errorText: snapshot.error,
            onTextChanged: _signupBloc.onChangePassword,
          );
        });
  }

  StreamBuilder getEmailTextField() {
    return StreamBuilder<String>(
        stream: _signupBloc.email,
        builder: (context, snapshot) {
          return CustomTextField(
            hintText: 'Email',
            prefixIcon: Icons.email,
            isObscure: false,
            keyboardType: TextInputType.emailAddress,
            errorText: snapshot.error,
            onTextChanged: _signupBloc.onChangeEmail,
          );
        });
  }

  StreamBuilder getNameTextField() {
    return StreamBuilder<String>(
        stream: _signupBloc.name,
        builder: (context, snapshot) {
          return CustomTextField(
            hintText: 'Name',
            prefixIcon: Icons.account_circle,
            isObscure: false,
            errorText: snapshot.error,
            onTextChanged: _signupBloc.onChangedName,
          );
        });
  }

  StreamBuilder getPhoneNumberTextField() {
    return StreamBuilder<String>(
        stream: _signupBloc.phone,
        builder: (context, snapshot) {
          return CustomTextField(
            hintText: 'Phone Number',
            prefixIcon: Icons.phone,
            isObscure: false,
            keyboardType: TextInputType.phone,
            errorText: snapshot.error,
            onTextChanged: _signupBloc.onChangedPhone,
          );
        });
  }

  callSignupApi() {}
}
