import 'package:fashion_wave/product/ui/product_screen.dart';
import 'package:flutter/material.dart';

import 'sign_up.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final UserProvider = Provider.of<UserProvider>(context);

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
                  controller: _usernameController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'UserName',
                      hintStyle: const TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _passwordController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      suffixIcon: const Icon(
                        Icons.remove_red_eye,
                      ),
                      suffixIconColor: Colors.white,
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
                // GestureDetector(
                //   onTap: loginProvider.isLoading
                //       ? null
                //       : () {
                //     loginProvider.login(
                //       _usernameController.text,
                //       _passwordController.text,
                //       context,
                //     );
                //   },
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     height: 44,
                //     decoration: BoxDecoration(
                //       color: Colors.red.shade400,
                //       borderRadius: BorderRadius.circular(40),
                //     ),
                //     child: Center(
                //         child: loginProvider.isLoading
                //             ? const CircularProgressIndicator(
                //           color: Colors.white,
                //         )
                //             : const Text(
                //           'LogIn',
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold),
                //         )),
                //   ),
                // ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductScreen(),
                            ));
                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(color: Colors.red, fontSize: 16),
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
