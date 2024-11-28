import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_register_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_register_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onLoginTap;

  const RegisterPage({
    super.key,
    required this.onLoginTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final repeatPasswordTextController = TextEditingController();

  // on register button tap
  void register() {
    // prepare the register information
    final String name = nameTextController.text;
    final String email = emailTextController.text;
    final String password = passwordTextController.text;
    final String repeatedPassword = repeatPasswordTextController.text;

    // initialize auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that all field aren't empty
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        repeatedPassword.isNotEmpty) {
      // ensure that both password match
      if (password == repeatedPassword) {
        // register a new user
        authCubit.register(name, email, password);
      }

      // if passwords don't match display an snack bar message
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords don\'t match'),
          ),
        );
      }
    }
    // if some fields are empty then display an error
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
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    repeatPasswordTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenAdapt(
      mobileScaffold: MobileRegisterPage(
        onRegisterTap: register,
        onLoginTap: widget.onLoginTap,
        nameTextController: nameTextController,
        emailTextController: emailTextController,
        passwordTextController: passwordTextController,
        repeatPasswordTextController: repeatPasswordTextController,
      ),
      tabletScaffold: DesktopRegisterPage(
        onRegisterTap: register,
        onLoginTap: widget.onLoginTap,
        nameTextController: nameTextController,
        emailTextController: emailTextController,
        passwordTextController: passwordTextController,
        repeatPasswordTextController: repeatPasswordTextController,
      ),
      desktopScaffold: DesktopRegisterPage(
        onRegisterTap: register,
        onLoginTap: widget.onLoginTap,
        nameTextController: nameTextController,
        emailTextController: emailTextController,
        passwordTextController: passwordTextController,
        repeatPasswordTextController: repeatPasswordTextController,
      ),
    );
  }
}
