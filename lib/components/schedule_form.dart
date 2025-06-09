import 'package:flutter/material.dart';
import 'package:post_scheduler_test/components/timer_selector.dart';
import '../models/post_model.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'date_selector.dart';

class ScheduleForm extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;
  final Function(Post) onPostScheduled;

  const ScheduleForm({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
    required this.onPostScheduled,
  });

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
    selectedTime = const TimeOfDay(hour: 12, minute: 0); 
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _schedulePost() {
    if (!_formKey.currentState!.validate()) return;

    final DateTime combinedDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final post = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      imageUrl:
                    'https://static.todamateria.com.br/upload/pa/is/paisagem-natural-og.jpg?class=ogImageSquare',

      scheduledDate: combinedDateTime,
    );

    widget.onPostScheduled(post);

    _titleController.clear();
    _descriptionController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post agendado com sucesso!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _titleController,
            label: 'Título',
            hint: 'Digite o título do post',
            maxLength: 100,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Título é obrigatório';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _descriptionController,
            label: 'Descrição',
            hint: 'Digite a descrição do post',
            maxLines: 4,
            maxLength: 500,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Descrição é obrigatória';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: DateSelector(
                  selectedDate: selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TimeSelector(
                  selectedTime: selectedTime,
                  onTimeChanged: (newTime) {
                    setState(() {
                      selectedTime = newTime;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: CustomButton(text: 'Agendar', onPressed: _schedulePost),
          ),
        ],
      ),
    );
  }
}
