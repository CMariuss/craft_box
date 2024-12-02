class Post {
  String userName;
  String profilePicturePath;
  String postMediaPath;
  String postTitle;
  String postDescription;
  String postDateTime;
  bool isUserPost;
  bool hasLike;
  bool isSaved;

  Post({
    required this.userName,
    required this.profilePicturePath,
    required this.postMediaPath,
    required this.postTitle,
    required this.postDescription,
    required this.postDateTime,
    required this.isUserPost,
    required this.hasLike,
    required this.isSaved,
  });
}
