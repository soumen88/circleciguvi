import 'package:circleciguvi/login/email_validator.dart';
import 'package:circleciguvi/login/input_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputFieldWidget(
                  controller: emailController,
                  displayHint: "Enter Email",
              ),
              SizedBox(
                height: 20,
              ),
              InputFieldWidget(
                  controller: passwordController,
                  displayHint: "Enter password",
                  isFieldPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              FilledButton(
                  onPressed: (){
                    if(formKey.currentState != null && formKey.currentState!.validate()){
                      print("EMail entered by user ${emailController.text}");
                    }

                  },
                  child: Text("Login")
              )
            ],
          ),
        ),
      ),
    );
  }
}
