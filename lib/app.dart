import 'package:craft_box/features/data/firebase_auth_repo.dart';
import 'package:craft_box/features/presentation/cubits/auth_cubit.dart';
import 'package:craft_box/features/presentation/cubits/auth_states.dart';
import 'package:craft_box/pages/auth_page.dart';
import 'package:craft_box/pages/home_page.dart';
import 'package:craft_box/pages/profile_page.dart';
import 'package:craft_box/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*

  Root Level of the app

  Database - repositories

   - firebase

  State management - Bloc Providers

  - authentication
  - profile
  - post
  - search
  - theme

  Check if the user is logged in - Auth State

  - Unauthenticated - go to auth page (login / register)
  - Authenticated - go to the home page

 */

class SocialMediaApp extends StatelessWidget {
  // get the auth repository
  final authRepo = FirebaseAuthRepo();

  SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, authState) {
            print(authState);

            // if user is not logged in then return the AuthPage - login / register pages
            if (authState is Unauthenticated) {
              return const AuthPage();
            }

            // otherwise - the user is logged in - display the home page
            if (authState is Authenticated) {
              return const HomePage();
            }

            // loading ..
            else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              );
            }
          },
          listener: (context, state) {},
        ),
        routes: {
          '/profile_page': (context) => const ProfilePage(),
          '/auth_page': (context) => const AuthPage(),
        },
      ),
    );
  }
}
