import 'package:flutter/material.dart';
import '../components/schedule_form.dart';
import '../models/post_model.dart';
import '../services/storage_service.dart';

class ScheduledPostsPage extends StatefulWidget {
  const ScheduledPostsPage({super.key});

  @override
  State<ScheduledPostsPage> createState() => _ScheduledPostsPageState();
}

class _ScheduledPostsPageState extends State<ScheduledPostsPage> {
  DateTime _selectedDate = DateTime.now();
  List<Post> _posts = [];
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final posts = await _storageService.loadPosts();
    setState(() {
      _posts = posts;
    });
  }

  Future<void> _savePosts() async {
    await _storageService.savePosts(_posts);
  }

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _onPostScheduled(Post post) {
    setState(() {
      _posts.add(post);
    });
    _savePosts();
  }

  void _onPostDeleted(String postId) {
    setState(() {
      _posts.removeWhere((post) => post.id == postId);
    });
    _savePosts();
  }

  List<Post> get _filteredPosts {
    return _posts.where((post) {
      return post.scheduledDate.year == _selectedDate.year &&
          post.scheduledDate.month == _selectedDate.month &&
          post.scheduledDate.day == _selectedDate.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Agendar postagem',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ScheduleForm(
                      selectedDate: _selectedDate,
                      onDateChanged: _onDateChanged,
                      onPostScheduled: _onPostScheduled,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),

                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // quantidade de itens
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 12),
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://static.todamateria.com.br/upload/pa/is/paisagem-natural-og.jpg?class=ogImageSquare',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: ScheduleForm(
                      selectedDate: _selectedDate,
                      onDateChanged: _onDateChanged,
                      onPostScheduled: _onPostScheduled,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
