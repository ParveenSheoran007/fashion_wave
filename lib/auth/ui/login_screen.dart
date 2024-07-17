import 'package:fashion_wave/auth/provider/user_providr.dart';
import 'package:fashion_wave/auth/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashion_wave/auth/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = UserModel(
      username: usernameController.text,
      password: passwordController.text,
    );

    try {
      await authProvider.login(user);
      if (authProvider.isAuthenticated) {
        Fluttertoast.showToast(
          msg: "Login successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Login failed: Incorrect username or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Login error: ${error.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

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
                  controller: usernameController,
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
                  controller: passwordController,
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
                InkWell(
                  onTap: () => _login(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                        child: Text(
                          'LogIn',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
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
                              builder: (context) => const SignUpScreen(),
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
