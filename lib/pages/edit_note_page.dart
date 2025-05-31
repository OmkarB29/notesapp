import 'package:flutter/material.dart';
import '../models/note.dart';

class EditNotePage extends StatelessWidget {
  final Note note;
  EditNotePage({super.key, required this.note});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = note.text;

    void _updateNote() {
      final updatedText = _controller.text.trim();
      if (updatedText.isNotEmpty) {
        Navigator.pop(context, Note(text: updatedText));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'Update your note'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateNote,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
