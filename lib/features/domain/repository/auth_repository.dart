// Current class outlines the possible authentication operations for the app

import 'package:craft_box/features/domain/entities/app_user.dart';

abstract class AuthRepo {
  // login with email and password
  Future<AppUser?> loginWithEmailPassword(String email, String password);

  // register with name, name, email and password
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password);

  // logout the user
  Future<void> logout();

  // get current user
  Future<AppUser?> getCurrentUser();
}
