import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;

  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          note.text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
