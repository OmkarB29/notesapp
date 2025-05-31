
import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _controller = TextEditingController();

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
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Enter your note'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final note = _controller.text.trim();
                if (note.isNotEmpty) Navigator.pop(context, note);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
