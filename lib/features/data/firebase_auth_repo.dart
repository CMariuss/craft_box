import 'package:craft_box/features/domain/entities/app_user.dart';
import 'package:craft_box/features/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) async {
    try {
      // attempt to sigh in the user
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // create the app user
      AppUser user = AppUser(
        userId: userCredential.user!.uid,
        email: email,
        name: '',
      );

      // return the app user
      return user;
    }

    // catch any errors
    catch (e) {
      throw Exception('Cannot login error: $e');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password) async {
    try {
      // attempt to create an account
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // create the app user
      AppUser user = AppUser(
        userId: userCredential.user!.uid,
        email: email,
        name: name,
      );

      // return the app user
      return user;
    }

    // catch any errors
    catch (e) {
      throw Exception('Cannot login error: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    // get the current logged in user from the Firebase
    final firebaseUser = firebaseAuth.currentUser;

    // if no user is logged in
    if (firebaseUser == null) {
      return null;
    }

    // if user exists
    return AppUser(
      userId: firebaseUser.uid,
      email: firebaseUser.email!,
      name: '',
    );
  }
}
