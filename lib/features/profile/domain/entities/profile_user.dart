import 'package:craft_box/features/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String bio;
  final String profilePictureUrl;

  ProfileUser({
    required super.userId,
    required super.email,
    required super.name,
    required this.bio,
    required this.profilePictureUrl,
  });

  // update the user profile
  ProfileUser copyWith({String? newBio, String? newProfilePictureUrl}) {
    return ProfileUser(
      userId: userId,
      email: email,
      name: name,
      bio: newBio ?? bio,
      profilePictureUrl: newProfilePictureUrl ?? profilePictureUrl,
    );
  }

  // convert a profile user to json format
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  // convert a json format to a profile user
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      userId: json['userId'],
      email: json['email'],
      name: json['name'],
      bio: json['bio'] ?? '',
      profilePictureUrl: json['profilePictureUrl'] ?? '',
    );
  }
}
