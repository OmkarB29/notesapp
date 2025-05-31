
import 'package:flutter/material.dart';

class EditNotePage extends StatefulWidget {
  final String note;

  const EditNotePage({super.key, required this.note});

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Update your note'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updated = _controller.text.trim();
                if (updated.isNotEmpty) Navigator.pop(context, updated);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
