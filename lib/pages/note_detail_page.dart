
import 'package:flutter/material.dart';

class NoteCardWidget extends StatelessWidget {
  final String note;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final int colorIndex;

  const NoteCardWidget({
    super.key,
    required this.note,
    required this.onEdit,
    required this.onDelete,
    required this.colorIndex,
  });

  Color _noteCardColor() {
    final pastelColors = [
      Colors.amber[100],
      Colors.blue[100],
      Colors.green[100],
      Colors.purple[100],
    ];
    return pastelColors[colorIndex % pastelColors.length]!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _noteCardColor(),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(note),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blueAccent),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
