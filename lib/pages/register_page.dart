import 'package:aquaria/classes/user.dart';
import 'package:aquaria/functions/functions.dart';

import 'package:aquaria/pages/home_page.dart';
import 'package:aquaria/pages/login_page.dart';
import 'package:aquaria/widgets/bubble_text_field.dart';
import 'package:aquaria/widgets/main_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00B4ED),
      // appBar: AppBar(
      //   title: const Text("Login Page"),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/logo.png"),
              ),
              const SizedBox(
                height: 80,
              ),
              BubbleTextField(
                icon: Icons.person_2_outlined,
                controller: _usernameController,
                label: "Enter your username...",
              ),
              const SizedBox(
                height: 25,
              ),
              BubbleTextField(
                icon: Icons.mail_outline_rounded,
                controller: _emailController,
                label: "Enter your email...",
              ),
              const SizedBox(
                height: 25,
              ),
              BubbleTextField(
                icon: Icons.lock_outline_rounded,
                controller: _passwordController,
                type: "password",
                label: "Enter your password...",
              ),
              const SizedBox(
                height: 25,
              ),
              BubbleTextField(
                icon: Icons.lock_reset_rounded,
                controller: _confirmPasswordController,
                type: "password",
                label: "Confirm your password...",
              ),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () async {
                  final username = _usernameController.text;
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  final confirmPassword = _confirmPasswordController.text;

                  // print("$username - $email - $password - $confirmPassword");

                  User? user = await registerUser(
                      username, email, password, confirmPassword);

                  if (user is User) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage()),
                    );
                  } else {
                    print("Registration Failed !!");
                  }

                  registerUser(username, email, password, confirmPassword);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                  );
                },
                child: MainButton(
                  label: "Sign Up",
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xffFE4600),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              // const Positioned(
              //   bottom: 0,
              //   left: 0,
              //   width: 100,
              //   height: 100,
              //   child: Image(
              //     image: AssetImage("assets/waves.png"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
