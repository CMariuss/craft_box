// Auth States

import 'package:craft_box/features/domain/entities/app_user.dart';

abstract class AuthStates {}

// initial
class AuthInitial extends AuthStates {}

// loading . .
class AuthLoading extends AuthStates {}

// authenticated
class Authenticated extends AuthStates {
  // get the user that is logged in
  final AppUser user;

  Authenticated(this.user);
}

// unauthenticated
class Unauthenticated extends AuthStates {}

// errors
class AuthError extends AuthStates {
  // error message
  final String message;

  AuthError(this.message);
}
