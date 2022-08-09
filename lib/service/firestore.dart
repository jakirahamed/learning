import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/model/notemodel.dart';

class NotesNotifier extends StateNotifier<List<NoteModel>?> {
  NotesNotifier() : super(null);

  final firebase = FirebaseFirestore.instance;
  final notectrl = TextEditingController();
  bool enableEdit = false;

  toggleEdit() {
    enableEdit = !enableEdit;
  }

  addNote(NoteModel note) async {
    EasyLoading.show(status: 'Loading...');
    final ref = firebase.collection('notes');
    if (notectrl.text.isNotEmpty) {
      await ref.add(note.toMap());
      notectrl.clear();
      EasyLoading.showSuccess('Done');
    } else {
      EasyLoading.showError('Something is worng');
    }
  }

  deleteNote(String id) async {
    EasyLoading.show(status: 'Loading...');
    final ref = firebase.collection('notes').doc(id);
    await ref.delete();
    EasyLoading.showSuccess('Done');
  }

  updatenote(NoteModel note, String id) async {
    EasyLoading.show(status: 'Loading...');
    final ref = firebase.collection('notes').doc(id);

    await ref.update(note.toMap());
    EasyLoading.showSuccess('Done');
  }
}

final noteProvider =
    StateNotifierProvider<NotesNotifier, List<NoteModel>?>((ref) {
  return NotesNotifier();
});

final notestreamProvider = StreamProvider<List<NoteModel>>((ref) {
  final firebase = FirebaseFirestore.instance;

  final snap = firebase.collection('notes').snapshots();
  final notestream = snap.map(
    (snapshot) => snapshot.docs
        .map(
          (doc) => NoteModel.fromMap(doc),
        )
        .toList(),
  );
  return notestream;
});
