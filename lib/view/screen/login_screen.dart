import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thoughtbox/view/screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Login To Continue',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFeildWidget(
                      controller: numberController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter Value';
                        }
                        return null;
                      },
                      hintText: 'Mobile Number',
                      inputType: TextInputType.number,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFeildWidget(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter Value';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      inputType: TextInputType.text,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'ForgetPassword?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LoginButtonwidget(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.to(
                            () => const OtpScreen(),
                          );
                        }
                      },
                      // onPressed: () =>
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'Don\'t Have An Account? '),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 25, 230, 216)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButtonwidget extends StatelessWidget {
  const LoginButtonwidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 5, 209, 232)),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}

class TextFeildWidget extends StatelessWidget {
  const TextFeildWidget({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.obscureText,
    required this.controller,
    required this.validator,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
