import 'package:craft_box/features/data/firebase_auth_repo.dart';
import 'package:craft_box/features/presentation/cubits/auth_cubit.dart';
import 'package:craft_box/features/presentation/cubits/auth_states.dart';
import 'package:craft_box/features/profile/data/firebase_profile_repo.dart';
import 'package:craft_box/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:craft_box/pages/auth_page.dart';
import 'package:craft_box/pages/home_page.dart';
import 'package:craft_box/pages/screen_sizes/mobile/mobile_profile_page.dart';
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

  // get the profile repository
  final profileRepo = FirebaseProfileRepo();

  SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // provide the cubits to the app
    return MultiBlocProvider(
      providers: [
        // auth cubit
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),

        // profile cubit
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(profileRepo: profileRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, authState) {
            // print(authState);

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
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
