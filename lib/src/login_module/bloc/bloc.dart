import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:vagus_ui/src/common_modules/validator_mixin.dart';

class LoginBloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get onChangedEmail => _emailController.sink.add;
  Function(String) get onChangedPassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  Stream<bool> get isValid =>
      Observable.combineLatest2(email, password, (e, q) => true);

  String get getEmail => _emailController.value;
  String get getPassword => _passwordController.value;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
