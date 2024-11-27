import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_box/features/profile/domain/entities/profile_user.dart';
import 'package:craft_box/features/profile/domain/repos/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo {
  // get an instance of FirebaseFirestore
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ProfileUser?> fetchUserProfile(String userId) async {
    try {
      // get the user document from Firebase CloudFirestore
      final userDocument =
          await firebaseFirestore.collection('users').doc(userId).get();

      // ensure that user document actually exists
      if (userDocument.exists) {
        // get data from user document
        final userData = userDocument.data();

        // ensure that userData contains any data
        if (userData != null) {
          // return a profile user with the fetched data
          return ProfileUser(
            userId: userId,
            email: userData['email'],
            name: userData['name'],
            bio: userData['bio'] ?? '',
            profilePictureUrl: userData['profilePictureUrl'].toString(),
          );
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfile) async {
    try {
      // convert the updated profile to json format to be able to store it in Firebase CloudFirestore
      await firebaseFirestore
          .collection('users')
          .doc(updatedProfile.userId)
          .update({
        'bio': updatedProfile.bio,
        'profilePictureUrl': updatedProfile.profilePictureUrl,
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
