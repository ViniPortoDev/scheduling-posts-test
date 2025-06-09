import 'package:flutter/material.dart';
import 'package:post_scheduler_test/models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(12),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          post.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.description, maxLines: 2, overflow: TextOverflow.ellipsis),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              post.scheduledDate.toLocal().toString().split(' ')[0],
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.more_vert),
    );
  }
}
