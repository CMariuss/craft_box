import 'package:craft_box/features/profile/domain/entities/profile_user.dart';
import 'package:craft_box/models/post.dart';

class PostProvider {
  static List<Post> postList = [];
  static List<Post> userPostList = [];

  static void generatePostList() {
    postList.clear();

    final Post post_01 = Post(
      userName: 'Crintea Marius',
      profilePicturePath: 'images/profile/profile_03.jpg',
      postMediaPath: 'images/posts/post_03.jpg',
      postTitle: 'Best carpentry tools',
      postDescription: 'The best carpentry tools you need in a carpentry shop',
      postDateTime: 'Today, 13:45',
      isUserPost: true,
      hasLike: false,
      isSaved: true,
    );

    final Post post_02 = Post(
      userName: 'Mary Jones',
      profilePicturePath: 'images/profile/profile_01.jpg',
      postMediaPath: 'images/posts/post_02.jpg',
      postTitle: 'Crocheted pillow',
      postDescription: 'Handmade crocheted pillow',
      postDateTime: 'Today, 11:03',
      isUserPost: false,
      hasLike: true,
      isSaved: true,
    );

    final Post post_03 = Post(
      userName: 'John Britton',
      profilePicturePath: 'images/profile/profile_02.jpg',
      postMediaPath: 'images/posts/post_01.jpg',
      postTitle: 'Wooden kitchen utensils',
      postDescription: 'Handmade wooden kitchen utensils',
      postDateTime: 'Yesterday, 08:53',
      isUserPost: false,
      hasLike: true,
      isSaved: false,
    );

    postList.addAll([post_01, post_02, post_03]);
  }

  // get user posts from general post list
  static void getUserPosts() {
    userPostList.clear();
    for (Post post in postList) {
      if (post.isUserPost) {
        userPostList.add(post);
      }
    }
  }
}
