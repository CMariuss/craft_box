import 'package:craft_box/components/auth_text_field.dart';
import 'package:craft_box/components/bottom_button.dart';
import 'package:craft_box/features/presentation/cubits/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileLoginPage extends StatefulWidget {
  final Function()? onLoginTap;
  final Function()? onRegisterTap;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  const MobileLoginPage({
    super.key,
    required this.onLoginTap,
    required this.onRegisterTap,
    required this.emailTextController,
    required this.passwordTextController,
  });

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // app logo
              Icon(
                CupertinoIcons.cube,
                size: 120,
                color: Theme.of(context).colorScheme.secondary,
              ),

              const SizedBox(height: 30),

              // welcome text
              Text(
                'Welcome back, let\'s login!',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 50),

              // email text field
              AuthTextField(
                isHidden: false,
                controller: widget.emailTextController,
                hintText: 'email . .',
              ),

              const SizedBox(height: 20),

              // password text field
              AuthTextField(
                isHidden: true,
                controller: widget.passwordTextController,
                hintText: 'password . .',
              ),

              const SizedBox(height: 20),

              // login button
              BottomButton(
                text: 'Login',
                color: Colors.deepOrangeAccent,
                onTap: widget.onLoginTap,
              ),

              const SizedBox(height: 40),

              // not a member text + register button (go to register page)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),

                  const SizedBox(width: 5),

                  // button
                  GestureDetector(
                    // go to register page on user tap
                    onTap: widget.onRegisterTap,
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
