import 'package:flutter/material.dart';

import 'email_validator.dart';

class InputFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final EmailValidator emailValidator = EmailValidator();
  final String displayHint;
  bool isFieldPassword;
  InputFieldWidget({required this.controller, required this.displayHint, this.isFieldPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: displayHint,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.black
            ),
            borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.blue
            )
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.red
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.red
            )
        ),
      ),
      validator: (String? userInput){

        if(userInput != null && userInput.isNotEmpty){
          String result;
          if(isFieldPassword){
            result = emailValidator.validatePassword(userInput);
          }
          else{
            result = emailValidator.validateEmail(userInput);
          }
          if(result.isNotEmpty){
            return result;
          }
          else{
            return null;
          }
        }
        else{
          return "Invalid Input";
        }
      },
    );
  }
}
