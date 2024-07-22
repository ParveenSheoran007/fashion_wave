
import 'sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

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

                ),
                const SizedBox(height: 20),
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
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _passwordController,
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(

                        borderRadius: BorderRadius.circular(40),
                      ),

                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        Navigator.push(

                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
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
