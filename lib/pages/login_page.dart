import 'package:craft_box/pages/screen_adapt.dart';
import 'package:craft_box/pages/screen_sizes/desktop/desktop_login_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_login_page.dart';
import 'package:craft_box/pages/screen_sizes/tablet/tablet_login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final Function()? onRegisterTap;

  const LoginPage({
    super.key,
    required this.onRegisterTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return ScreenAdapt(
      mobileScaffold: MobileLoginPage(
        onLoginTap: login,
        onRegisterTap: widget.onRegisterTap,
        emailTextController: emailTextController,
        passwordTextController: passwordTextController,
      ),
      tabletScaffold: TabletLoginPage(
        onLoginTap: login,
        onRegisterTap: widget.onRegisterTap,
        emailTextController: emailTextController,
        passwordTextController: passwordTextController,
      ),
      desktopScaffold: DesktopLoginPage(
        onLoginTap: login,
        onRegisterTap: widget.onRegisterTap,
        emailTextController: emailTextController,
        passwordTextController: passwordTextController,
      ),
    );
  }
}
