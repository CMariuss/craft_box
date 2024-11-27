// ABSTRACT CLASS ProfileStates
// LIST ALL POSSIBLE PROFILE STATES

import '../../domain/entities/profile_user.dart';

abstract class ProfileStates {}

// initial state
class ProfileInitial extends ProfileStates {}

// loading state
class ProfileLoading extends ProfileStates {}

// loaded state
class ProfileLoaded extends ProfileStates {
  // store the profile
  final ProfileUser profileUser;

  ProfileLoaded(this.profileUser);
}

// error state
class ProfileError extends ProfileStates {
  // store the error message
  final String message;

  ProfileError(this.message);
}
