import 'package:rxdart/rxdart.dart';
import 'package:vagus_ui/src/common_modules/validator_mixin.dart';

class SignupBloc extends Object with Validators {
  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();

  Stream<String> get name => _nameController.stream.transform(nameValidator);
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);
  Stream<String> get phone => _phoneController.stream.transform(phoneValidator);

  Function(String) get onChangedName => _nameController.sink.add;
  Function(String) get onChangeEmail => _emailController.sink.add;
  Function(String) get onChangePassword => _passwordController.sink.add;
  Function(String) get onChangedPhone => _phoneController.sink.add;

  Stream<bool> get isValid => Observable.combineLatest4(name, email, password, phone, (n, e, p, ph) => true);

  dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
    _phoneController.close();
  }
}
