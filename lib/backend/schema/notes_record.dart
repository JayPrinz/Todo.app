import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notes_title" field.
  String? _notesTitle;
  String get notesTitle => _notesTitle ?? '';
  bool hasNotesTitle() => _notesTitle != null;

  // "notes_content" field.
  String? _notesContent;
  String get notesContent => _notesContent ?? '';
  bool hasNotesContent() => _notesContent != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _notesTitle = snapshotData['notes_title'] as String?;
    _notesContent = snapshotData['notes_content'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _users = snapshotData['users'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  String? notesTitle,
  String? notesContent,
  DateTime? date,
  DocumentReference? users,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notes_title': notesTitle,
      'notes_content': notesContent,
      'date': date,
      'users': users,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    return e1?.notesTitle == e2?.notesTitle &&
        e1?.notesContent == e2?.notesContent &&
        e1?.date == e2?.date &&
        e1?.users == e2?.users;
  }

  @override
  int hash(NotesRecord? e) => const ListEquality()
      .hash([e?.notesTitle, e?.notesContent, e?.date, e?.users]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
