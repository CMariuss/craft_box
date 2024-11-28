import 'package:craft_box/components/auth_text_field.dart';
import 'package:craft_box/components/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/presentation/cubits/auth_cubit.dart';

class DesktopRegisterPage extends StatefulWidget {
  final Function()? onRegisterTap;
  final Function()? onLoginTap;
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController repeatPasswordTextController;

  const DesktopRegisterPage({
    super.key,
    required this.onRegisterTap,
    required this.onLoginTap,
    required this.nameTextController,
    required this.emailTextController,
    required this.passwordTextController,
    required this.repeatPasswordTextController,
  });

  @override
  State<DesktopRegisterPage> createState() => _DesktopRegisterPageState();
}

class _DesktopRegisterPageState extends State<DesktopRegisterPage> {
  final double fieldsWidth = 350;

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

              const SizedBox(height: 35),

              // welcome text
              Text(
                'Hi, let\'s create an account!',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 35),

              // name text field
              SizedBox(
                width: fieldsWidth,
                child: AuthTextField(
                  isHidden: false,
                  controller: widget.nameTextController,
                  hintText: 'your name . .',
                ),
              ),

              const SizedBox(height: 20),

              // email text field
              SizedBox(
                width: fieldsWidth,
                child: AuthTextField(
                  isHidden: false,
                  controller: widget.emailTextController,
                  hintText: 'email . .',
                ),
              ),

              const SizedBox(height: 20),

              // password text field
              SizedBox(
                width: fieldsWidth,
                child: AuthTextField(
                  isHidden: true,
                  controller: widget.passwordTextController,
                  hintText: 'password . .',
                ),
              ),

              const SizedBox(height: 20),

              // password text field
              SizedBox(
                width: fieldsWidth,
                child: AuthTextField(
                  isHidden: true,
                  controller: widget.repeatPasswordTextController,
                  hintText: 'repeat password . .',
                ),
              ),

              const SizedBox(height: 30),

              // login button
              SizedBox(
                width: fieldsWidth,
                child: BottomButton(
                  text: 'Register',
                  color: Colors.deepOrangeAccent,
                  onTap: widget.onRegisterTap,
                ),
              ),

              const SizedBox(height: 40),

              // not a member text + register button (go to register page)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text
                  Text(
                    'Have an account?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),

                  const SizedBox(width: 5),

                  // button
                  GestureDetector(
                    // go to login page on user tap
                    onTap: widget.onLoginTap,
                    child: const Text(
                      'Login here',
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
