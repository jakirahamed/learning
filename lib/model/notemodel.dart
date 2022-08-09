// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  final String note;
  final Timestamp date;
  final bool ispined;
  final String id;
  NoteModel({
    required this.note,
    required this.date,
    required this.ispined,
    required this.id,
  });

  NoteModel copyWith({
    String? note,
    Timestamp? date,
    bool? ispined,
  }) {
    return NoteModel(
      note: note ?? this.note,
      date: date ?? this.date,
      ispined: ispined ?? this.ispined,
      id: id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'note': note,
      'date': date,
      'ispined': ispined,
    };
  }

  factory NoteModel.fromMap(DocumentSnapshot map) {
    return NoteModel(
      note: map['note'] as String,
      date: map['date'],
      ispined: map['ispined'] as bool,
      id: map.id,
    );
  }
}
