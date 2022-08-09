import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:learning/model/notemodel.dart';
import 'package:learning/page/note_info.dart';

import '../service/firestore.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  // static const String routename = '/';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteser = ref.read(noteProvider.notifier);
    final notes = ref.watch(notestreamProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: noteser.notectrl,
              decoration: InputDecoration(
                hintText: 'Note',
                suffixIcon: IconButton(
                  onPressed: () {
                    noteser.addNote(
                      NoteModel(
                        note: noteser.notectrl.text,
                        date: Timestamp.now(),
                        ispined: false,
                        id: '',
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ),
            notes.when(
              data: (notelist) => Expanded(
                child: ListView.builder(
                  itemCount: notelist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NoteInfo.routename,
                            arguments: notelist[index],
                          );
                        },
                        title: Text(notelist[index].note),
                        subtitle: Text(
                          DateFormat().format(
                            notelist[index].date.toDate(),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            noteser.deleteNote(notelist[index].id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                ),
              ),
              error: (error, stackTrace) => Text('error $error'),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
