import 'package:craft_box/features/domain/entities/app_user.dart';
import 'package:craft_box/features/domain/repository/auth_repository.dart';

class FirebaseAuthRepo implements AuthRepo {
  @override
  Future<AppUser?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> loginWithEmailPassword(String email, String password) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
      String name, String email, String password) {
    // TODO: implement registerWithEmailPassword
    throw UnimplementedError();
  }
}
