import 'dart:async';

import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/p_check.dart';
import 'package:barcode_generator/constants/theme.dart';
import 'package:barcode_generator/database/firebase_db.dart';
import 'package:barcode_generator/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isObscure = true;
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  bool isCreating = false;

  final containsDigit = RegExp(r'[0-9]');
  final symbolRegex = RegExp(r'[!@#$%^&*()]');
  final hasUpperCase = RegExp(r'[A-Z]');
  final hasLowerCase = RegExp(r'[a-z]');
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Register",
          style: appbartheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          height: double.infinity,
          color: AppColors().primaryColor,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create Account",
                      style: texttheme,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: inputTheme,
                    controller: _namecontroller,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return "inavalid name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "name",
                      hintStyle: hintTexttheme,
                      labelStyle: labletheme,
                      prefixIcon: Icon(
                        Icons.people,
                        color: AppColors().white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: AppColors().orange, width: 4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().orange),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: inputTheme,
                    controller: _emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return "inavalid email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "email",
                      hintStyle: hintTexttheme,
                      labelStyle: labletheme,
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors().white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: AppColors().orange, width: 4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().orange),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: _passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return " invalid password";
                      } else {
                        return null;
                      }
                    },
                    style: inputTheme,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "password",
                      hintStyle: hintTexttheme,
                      labelStyle: labletheme,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors().white,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: _isObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        color:
                            _isObscure ? AppColors().grey : AppColors().white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: AppColors().orange, width: 4),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().grey),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: AppColors().orange),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PCheck(
                      checkValue: _passwordcontroller.text,
                      isCheck: containsDigit,
                      title: 'Contains Digit'),
                  const SizedBox(
                    height: 10,
                  ),
                  PCheck(
                      checkValue: _passwordcontroller.text,
                      isCheck: symbolRegex,
                      title: 'Contains Symbol'),
                  const SizedBox(
                    height: 10,
                  ),
                  PCheck(
                      checkValue: _passwordcontroller.text,
                      isCheck: hasUpperCase,
                      title: 'Contains UpperCase'),
                  const SizedBox(
                    height: 10,
                  ),
                  PCheck(
                      checkValue: _passwordcontroller.text,
                      isCheck: hasLowerCase,
                      title: 'Contains LowerCase'),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isCreating
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors().orange),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isCreating = true;
                              });
                              await FirebaseDb.createUser(
                                userName: _namecontroller.text,
                                userEmail: _emailcontroller.text.trim(),
                                userPassword: _passwordcontroller.text.trim(),
                              );
                              setState(() {
                                isCreating = false;
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors().green,
                                  duration: const Duration(seconds: 2),
                                  content: const Text(
                                      "User Registered Successfully"),
                                ),
                              );
                              Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScrren(),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: texttheme,
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: appbartheme,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScrren(),
                            ),
                          );
                        },
                        child: Text(
                          "Signin",
                          style: buttonTheme,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
