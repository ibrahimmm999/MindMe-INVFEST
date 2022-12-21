import 'package:flutter/material.dart';
import 'package:src/shared/theme.dart';
import 'package:src/ui/user_pages/sign_up_page.dart';
import 'package:src/ui/widgets/custom_button.dart';

import 'widgets/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
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
          buttonText: "Sign In",
          widthButton: double.infinity,
          onPressed: () {},
          heightButton: 50);
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Login",
              style: primaryColorText.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            Text(
              "Sign In to Countinue",
              style: greyText.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: 70,
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
              "Password",
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
              height: 220,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: secondaryColorText.copyWith(fontSize: 12),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Sign Up",
                      style: primaryColorText.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
