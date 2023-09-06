import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../componets/my_button.dart";
import "../componets/my_textfield.dart";
import "../componets/square_tile.dart";
import "../service/auth_service.dart";

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void SignuserIn() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
        // Navigate to the next screen or perform necessary actions
      } catch (e) {
        Navigator.pop(context);
        print("Error signing in: $e");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error signing in. Please try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 60,
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Welcome Back we miss you a lot",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40),
                  MyTextField(
                    controller1: usernameController,
                    hintText: "Email / Username",
                    obscureText: false,
                  ),
                  MyTextField(
                    controller1: passwordController,
                    hintText: "Password",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (value.length < 8 || value.length > 10) {
                        return 'Password length should be between 8 and 10 characters';
                      }
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'At least 1 capital letter required';
                      }
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'At least 1 small letter required';
                      }
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'At least 1 number required';
                      }
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'At least 1 special character required';
                      }
                      return null; // Return null if the input is valid
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // submit button
                  Mybutton(
                    onTap: SignuserIn,
                  ),
                  SizedBox(height: 40),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Or Continue With",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  // more options button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                          onTap: () => AuthService().signInWithGoogle(),
                          image:
                              "https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png"),
                      SquareTile(
                          onTap: () {},
                          image:
                              "https://cdn-icons-png.flaticon.com/512/15/15476.png"),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text.rich(TextSpan(
                    text: "Don't have an account? ",
                    children: [
                      TextSpan(
                        text: "Register Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )) // register now
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
