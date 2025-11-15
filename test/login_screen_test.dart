import 'package:circleciguvi/login/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  EmailValidator emailValidatorObject = EmailValidator();
  test("Validate Empty Email id", (){

    var result =  emailValidatorObject.validateEmail("");
    expect(result, 'Enter Email');
  });

  test("Validate Invalid Email id", (){

    var result =  emailValidatorObject.validateEmail("examplegmail.com");
    expect(result, 'Enter Valid Email');
  });

  test("Invalid Password", (){
    var result =  emailValidatorObject.validatePassword("abcd");
    expect(result, 'Password is too short');
  });

  test("Valid Password", (){
    var result =  emailValidatorObject.validatePassword("abcd@1234");
    expect(result, '');
  });
}