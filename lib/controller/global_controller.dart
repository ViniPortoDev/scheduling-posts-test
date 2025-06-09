import 'package:post_scheduler_test/models/post_model.dart';

class GlobalController {
  List<Post> posts = [
    Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      imageUrl:
          'https://static.todamateria.com.br/upload/pa/is/paisagem-natural-og.jpg?class=ogImageSquare',
      title: 'Post Title',
      description:
          'This is a sample post description that can be quite long and should be truncated in the UI.',
      scheduledDate: DateTime.now(),
    ),
  ];
  DateTime? selectedDate;
  bool isLoading = false;

  void addPost(Post post) {
    posts.add(post);
  }

  void toggleLoading() {
    isLoading = !isLoading;
  }
}
