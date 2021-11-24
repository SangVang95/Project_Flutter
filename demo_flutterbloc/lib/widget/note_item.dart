import 'package:demo_flutterbloc/model/note.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Color color;
  final Function(Note) onTap;

  const NoteItem(
      {Key? key, required this.onTap, required this.note, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(note),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 150,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${note.id}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                Text(
                  '${note.title}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 3,
                ),
                Text(
                  '${note.date} ${note.content}',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 3,
                )
              ],
            ),
          ),
        ));
  }
}
