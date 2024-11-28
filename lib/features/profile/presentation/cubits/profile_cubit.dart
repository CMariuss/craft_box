import 'package:craft_box/features/profile/domain/repos/profile_repo.dart';
import 'package:craft_box/features/profile/presentation/cubits/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  // get the profile repository
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  // fetch user profile using repository
  Future<void> fetchUserProfile(String userId) async {
    try {
      // emit a loading profile state
      emit(ProfileLoading());

      // fetch the user profile
      final userProfile = await profileRepo.fetchUserProfile(userId);

      // check if user is successfully fetched
      if (userProfile != null) {
        // emit a loaded profile state
        emit(ProfileLoaded(userProfile));
      } else {
        // emit a error profile state
        emit(ProfileError('User not fount'));
      }
    } catch (e) {
      // emit a error profile state
      emit(ProfileError(e.toString()));
    }
  }

  // update bio / profile picture
  Future<void> updateProfile({
    // require the user profile to know what profile to update
    required String userId,
    // get new bio text
    String? newBio,
  }) async {
    // emit a loading profile state
    emit(ProfileLoading());

    try {
      // fetch current user profile
      final currentUser = await profileRepo.fetchUserProfile(userId);

      // if the user does not exist then emit a error state
      if (currentUser == null) {
        emit(ProfileError('Cannot fetch the user profile'));
        return;
      }

      // update the profile picture

      // update the profile
      final updatedProfile =
          currentUser.copyWith(newBio: newBio ?? currentUser.bio);

      // update the profile in repository
      await profileRepo.updateProfile(updatedProfile);

      // reload the updated profile
      await fetchUserProfile(userId);
      // emit a loaded profile state
      // emit(ProfileLoaded(currentUser));
    } catch (e) {
      // emit a error state
      emit(ProfileError('Cannot update the profile: $e'));
    }
  }
}
