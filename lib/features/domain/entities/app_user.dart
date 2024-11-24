// App user class
// User id, email and name
// Convert app user to json an vice versa

class AppUser {
  final String userId;
  final String email;
  final String name;

  AppUser({
    required this.userId,
    required this.email,
    required this.name,
  });

  // convert app user -> json
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

  // convert json user -> app user
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      userId: jsonUser['userId'],
      email: jsonUser['email'],
      name: jsonUser['name'],
    );
  }
}
