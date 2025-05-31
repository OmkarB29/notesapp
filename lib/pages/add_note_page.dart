import 'package:flutter/material.dart';
import '../models/note.dart';

class AddNotePage extends StatelessWidget {
  AddNotePage({super.key});
  final TextEditingController _controller = TextEditingController();

  void _saveNote(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      Navigator.pop(context, Note(text: text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'Enter your note'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveNote(context),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
