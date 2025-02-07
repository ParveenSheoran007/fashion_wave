import 'dart:ui';

import 'package:fashion_wave/auth/provider/auth_providr.dart';
import 'package:fashion_wave/auth/ui/sign_up_screen.dart';
import 'package:fashion_wave/product/ui/product_screen.dart';
import 'package:fashion_wave/shared/color_const.dart';
import 'package:fashion_wave/shared/string_const_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final AuthProvider userProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  'assets/Screenshot_2024-07-17_123441-removebg-preview.png',
                  width: 200,
                )),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: usernameController,
                  cursorColor: ColorConst.corsourColor,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: StringConstText.emailText,
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color:  ColorConst.textfilled),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: passwordController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                      hintText: StringConstText.passwordText,
                      hintStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: userProvider.isLoading
                      ? null
                      : () {
                          userProvider.login(
                            usernameController.text,
                            passwordController.text,
                            context,
                          );
                        },
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductScreen(),
                          ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                          child: userProvider.isLoading
                              ? const CircularProgressIndicator(
                                  color: ColorConst.buttonColor,
                                )
                              :  Text(
                            StringConstText.loginButton,
                                  style: const TextStyle(
                                      color:Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      StringConstText.newAccount,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child:  Text(
                        StringConstText.signUpText,
                        style: const TextStyle(color: ColorConst.buttonColor, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
