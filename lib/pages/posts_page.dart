import 'package:flutter/material.dart';
import 'package:post_scheduler_test/components/post_card.dart';
import 'package:post_scheduler_test/controller/global_controller.dart';
import 'package:post_scheduler_test/pages/scheduled_posts_page.dart';
import 'package:table_calendar/table_calendar.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  PostsPageState createState() => PostsPageState();
}

class PostsPageState extends State<PostsPage> {
  late final GlobalController controller;
  @override
  void initState() {
    super.initState();
    controller = GlobalController();
  }

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScheduledPostsPage()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Postagens agendadas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  markersAlignment: Alignment.bottomCenter,
                  markerDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarFormat: CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.monday,
              ),
              SizedBox(height: 16),
              Text(
                "Postagens agendadas",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (controller.isLoading)
                Center(child: CircularProgressIndicator()),
              if (!controller.isLoading && controller.posts.isEmpty)
                Center(
                  child: Text(
                    "Nenhuma postagem agendada",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              if (!controller.isLoading && controller.posts.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) {
                    final post = controller.posts[index];
                    return PostCard(post: post);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
