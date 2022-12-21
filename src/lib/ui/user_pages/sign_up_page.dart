import 'package:flutter/material.dart';
import 'package:src/ui/sign_in_page.dart';
import 'package:src/ui/widgets/custom_button.dart';

import '../../shared/theme.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController fullNameController =
      TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget inputFullName() {
      return CustomTextFormField(
        icon: Icon(
          Icons.person_rounded,
          color: primaryColor,
        ),
        hintText: 'Your Full Name',
        controller: emailController,
        radiusBorder: defaultRadius,
      );
    }

    Widget inputUsername() {
      return CustomTextFormField(
        icon: Icon(
          Icons.radio_button_checked_rounded,
          color: primaryColor,
        ),
        hintText: 'Your Username',
        controller: emailController,
        radiusBorder: defaultRadius,
      );
    }

    Widget inputEmail() {
      return CustomTextFormField(
        icon: Icon(
          Icons.email_sharp,
          color: primaryColor,
        ),
        hintText: 'Your Email',
        controller: emailController,
        radiusBorder: defaultRadius,
      );
    }

    Widget inputPassword() {
      return CustomTextFormField(
        icon: Icon(Icons.lock, color: primaryColor),
        controller: passwordController,
        hintText: 'Your Password',
        obscureText: true,
        radiusBorder: defaultRadius,
      );
    }

    Widget submitButton() {
      return CustomButton(
          radiusButton: defaultRadius,
          buttonColor: primaryColor,
          buttonText: "Sign Up",
          widthButton: double.infinity,
          onPressed: () {},
          heightButton: 50);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: primaryColorText.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                "Register and Happy Your Mind",
                style: greyText.copyWith(fontSize: 14),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Full Name",
                style: secondaryColorText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              inputFullName(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Username",
                style: secondaryColorText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              inputUsername(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Email Address",
                style: secondaryColorText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              inputEmail(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Email Address",
                style: secondaryColorText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 12,
              ),
              inputPassword(),
              SizedBox(
                height: 30,
              ),
              submitButton(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: secondaryColorText.copyWith(fontSize: 12),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        "Sign In",
                        style: primaryColorText.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
