import 'package:craft_box/components/auth_text_field.dart';
import 'package:craft_box/components/bottom_button.dart';
import 'package:craft_box/features/presentation/cubits/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesktopLoginPage extends StatefulWidget {
  final Function()? onTap;

  const DesktopLoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<DesktopLoginPage> createState() => _DesktopLoginPageState();
}

class _DesktopLoginPageState extends State<DesktopLoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // on login button pressed
  void login() {
    // get email and password from text fields
    final String email = emailTextController.text;
    final String password = passwordTextController.text;

    // get auth cubit
    final authCubit = context.read<AuthCubit>();

    // check if email and password is empty
    if (email.isNotEmpty && password.isNotEmpty) {
      // login
      authCubit.login(email, password);
    }
    // if email or password is empty then display an error
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill both the email and password text fields'),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

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
                  width: 400,
                  child: AuthTextField(
                    isHidden: false,
                    controller: emailTextController,
                    hintText: 'email . .',
                  ),
                ),

                const SizedBox(height: 20),

                // password text field
                SizedBox(
                  width: 400,
                  child: AuthTextField(
                    isHidden: true,
                    controller: passwordTextController,
                    hintText: 'password . .',
                  ),
                ),

                const SizedBox(height: 20),

                // login button
                SizedBox(
                  width: 400,
                  child: BottomButton(
                    text: 'Login',
                    color: Colors.deepOrangeAccent,
                    onTap: () {
                      login();
                    },
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
                      onTap: widget.onTap,
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
