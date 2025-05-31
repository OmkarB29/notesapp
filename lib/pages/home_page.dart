
import 'package:flutter/material.dart';
import 'add_note_page.dart';
import 'edit_note_page.dart';
import 'note_detail_page.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  final List<String> _notes = [];

  void _addNote(String note) {
    setState(() => _notes.add(note));
    _showSnackBar('Note added');
  }

  void _editNote(int index, String updatedNote) {
    setState(() => _notes[index] = updatedNote);
    _showSnackBar('Note updated');
  }

  void _deleteNote(int index) {
    setState(() => _notes.removeAt(index));
    _showSnackBar('Note deleted');
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Creative Notes')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final newNote = await Navigator.push<String>(
            context,
            MaterialPageRoute(builder: (_) => const AddNotePage()),
          );
          if (newNote != null) _addNote(newNote);
        },
        label: const Text('Add Note'),
        icon: const Icon(Icons.add),
      ),
      body: _notes.isEmpty
          ? const Center(child: Text('No notes yet. Tap + to add one!'))
          : ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (_, index) => NoteCardWidget(
                note: _notes[index],
                onEdit: () async {
                  final updated = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditNotePage(note: _notes[index]),
                    ),
                  );
                  if (updated != null) _editNote(index, updated);
                },
                onDelete: () => _deleteNote(index),
                colorIndex: index,
              ),
            ),
    );
  }
}
