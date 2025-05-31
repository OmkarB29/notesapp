import 'package:flutter/material.dart';
import '../models/note.dart';
import 'add_note_page.dart';
import 'edit_note_page.dart';
import 'note_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];

  void _navigateToAddNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddNotePage()),
    );
    if (result != null && result is Note) {
      setState(() => notes.add(result));
    }
  }

  void _navigateToEditNote(int index) async {
    final updatedNote = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditNotePage(note: notes[index]),
      ),
    );
    if (updatedNote != null && updatedNote is Note) {
      setState(() => notes[index] = updatedNote);
    }
  }

  void _navigateToNoteDetail(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NoteDetailPage(note: note),
      ),
    );
  }

  void _deleteNote(int index) {
    setState(() => notes.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes App')),
      body: notes.isEmpty
          ? const Center(child: Text('No notes yet! Tap + to add one.'))
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(notes[index].text),
                  onTap: () => _navigateToNoteDetail(notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _navigateToEditNote(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNote(index),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
