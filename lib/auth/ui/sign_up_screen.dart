import 'package:fashion_wave/shared/color_const.dart';
import 'package:fashion_wave/shared/string_const_text.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
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
                  cursorColor: ColorConst.corsourColor,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: StringConstText.emailText,
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:
                            const BorderSide(color: ColorConst.textfilled),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  cursorColor: ColorConst.corsourColor,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: StringConstText.passwordText,
                      hintStyle: const TextStyle(color: Colors.white),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                      ),
                      suffixIconColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:
                            const BorderSide(color: ColorConst.textfilled),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  decoration: BoxDecoration(
                    color: ColorConst.buttonColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                      child: Text(
                    StringConstText.signUpButton,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstText.alreadyAccount,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        StringConstText.loginText,
                        style: const TextStyle(
                            color: ColorConst.buttonColor, fontSize: 16),
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
