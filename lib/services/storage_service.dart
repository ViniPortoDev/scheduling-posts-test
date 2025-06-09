import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_model.dart';

class StorageService {
  static const String _postsKey = 'scheduled_posts';

  Future<List<Post>> loadPosts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final postsJson = prefs.getStringList(_postsKey) ?? [];

      return postsJson
          .map((postJson) => Post.fromJson(json.decode(postJson)))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> savePosts(List<Post> posts) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final postsJson =
          posts.map((post) => json.encode(post.toJson())).toList();

      await prefs.setStringList(_postsKey, postsJson);
    } catch (e) {}
  }
}
