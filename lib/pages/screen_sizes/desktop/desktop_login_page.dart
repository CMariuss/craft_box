import 'package:craft_box/components/auth_text_field.dart';
import 'package:craft_box/components/bottom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DesktopLoginPage extends StatefulWidget {
  final Function()? onLoginTap;
  final Function()? onRegisterTap;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  const DesktopLoginPage({
    super.key,
    required this.onLoginTap,
    required this.onRegisterTap,
    required this.emailTextController,
    required this.passwordTextController,
  });

  @override
  State<DesktopLoginPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopLoginPage> {
  final double fieldsWidth = 350;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // app logo
                Icon(
                  CupertinoIcons.cube,
                  size: 150,
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

                // login button
                SizedBox(
                  width: fieldsWidth,
                  child: BottomButton(
                    text: 'Login',
                    color: Colors.deepOrangeAccent,
                    onTap: widget.onLoginTap,
                  ),
                ),

                const SizedBox(height: 50),

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
        ],
      ),
    );
  }
}
