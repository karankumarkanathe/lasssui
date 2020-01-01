import 'dart:async';

mixin Validators {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      sink.addError('Please enter vaild email');
    else
      sink.add(email);
  });

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 7) {
      sink.add(password);
    } else {
      sink.addError('Password must contain atleast 8 characters.');
    }
  });

  var nameValidator =StreamTransformer<String,String>.fromHandlers(
    handleData: (name,sink){
      if (name.length > 1){
        sink.add(name);
      }else{
        sink.addError('Invalid Name');
      }
    }
  );

  var phoneValidator =StreamTransformer<String,String>.fromHandlers(
    handleData: (phone,sink){
      if (phone.length > 6){
        sink.add(phone);
      }else{
        sink.addError('Invalid phone number');
      }
    }
  );
}