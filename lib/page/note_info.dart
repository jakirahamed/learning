import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/model/notemodel.dart';

import '../service/firestore.dart';

class NoteInfo extends ConsumerWidget {
  const NoteInfo({Key? key, required this.noteModel}) : super(key: key);
  static const String routename = 'noteinfo';
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteser = ref.read(noteProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              noteser.toggleEdit();
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (noteser.enableEdit == false) Text(noteModel.note),
            if (noteser.enableEdit)
              TextFormField(
                controller: noteser.notectrl,
                decoration: InputDecoration(
                  hintText: 'Note',
                  suffixIcon: IconButton(
                    onPressed: () {
                      noteser.toggleEdit();
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
