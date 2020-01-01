import 'package:flutter/material.dart';
import 'package:vagus_ui/src/common_modules/logo_widget.dart';
import 'package:vagus_ui/src/common_modules/rounded_button.dart';
import 'package:vagus_ui/src/common_modules/textfield_widget.dart';
import 'package:vagus_ui/src/forgot_password/forgot_password_screen.dart';
import 'package:vagus_ui/src/login_module/bloc/bloc.dart';
import 'package:vagus_ui/src/signup_module/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc = LoginBloc();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new LogoWidget(),
              Column(
                children: <Widget>[
                  getEmailTextField(),
                  Divider(),
                  getPasswordTextField(),
                  getForgotPasswordButton(context)
                ],
              ),
              StreamBuilder<bool>(
                  stream: _loginBloc.isValid,
                  builder: (context, snapshot) {
                    return RoundedButton(
                      title: 'Login',
                      onPressed:() => moveToNextScreen()
                    );
                  }),
              getCreateAccoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  FlatButton getCreateAccoutButton(BuildContext context) {
    return FlatButton(
      child: Text('Don\'t have an account? Create One'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignupScreen()));
      },
    );
  }

  Row getForgotPasswordButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          child: Text('Forgot your password?'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(),
                    settings: RouteSettings()));
          },
        ),
      ],
    );
  }

  StreamBuilder getEmailTextField() {
    return StreamBuilder<String>(
        stream: _loginBloc.email,
        builder: (context, snapshot) {
          return CustomTextField(
            hintText: 'Email',
            prefixIcon: Icons.email,
            isObscure: false,
            keyboardType: TextInputType.emailAddress,
            errorText: snapshot.error,
            onTextChanged: _loginBloc.onChangedEmail,
          );
        });
  }

  StreamBuilder getPasswordTextField() {
    return StreamBuilder<String>(
        stream: _loginBloc.password,
        builder: (context, snapshot) {
          return CustomTextField(
            hintText: 'Password',
            prefixIcon: Icons.security,
            isObscure: true,
            errorText: snapshot.error,
            onTextChanged: _loginBloc.onChangedPassword,
          );
        });
  }

  moveToNextScreen() {
    print(_loginBloc.getEmail);
    print(_loginBloc.getPassword);
  }
}
