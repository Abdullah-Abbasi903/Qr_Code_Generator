import 'package:barcode_generator/constants/app_colors.dart';
import 'package:barcode_generator/constants/theme.dart';
import 'package:barcode_generator/database/firebase_db.dart';
import 'package:barcode_generator/screens/home_screen.dart';
import 'package:barcode_generator/screens/signup.dart';
import 'package:flutter/material.dart';

class LoginScrren extends StatefulWidget {
  const LoginScrren({super.key});

  @override
  State<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends State<LoginScrren> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isCreating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors().primaryColor,
        title: Text(
          "Login",
          style: appbartheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          width: double.infinity,
          color: AppColors().primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    "Login To Account",
                    style: texttheme,
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
                    hintText: "Eamil",
                    labelText: "email",
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
                  controller: _passwordcontroller,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return "Required Field";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "password",
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
                            await FirebaseDb.getUser(
                              userEmail: _emailcontroller.text.trim(),
                              userPassword: _passwordcontroller.text.trim(),
                            );
                            setState(
                              () {
                                isCreating = false;
                              },
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors().green,
                                duration: const Duration(seconds: 2),
                                content:
                                    const Text("User Logged In Successfully"),
                              ),
                            );
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
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
                      "Dont have an account?",
                      style: appbartheme,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ),
                        );
                      },
                      child: Text(
                        "SignUp",
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
    );
  }
}
