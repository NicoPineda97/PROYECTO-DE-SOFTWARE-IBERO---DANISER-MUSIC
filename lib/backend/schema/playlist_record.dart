import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistRecord extends FirestoreRecord {
  PlaylistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "songs" field.
  List<DocumentReference>? _songs;
  List<DocumentReference> get songs => _songs ?? const [];
  bool hasSongs() => _songs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _songs = getDataList(snapshotData['songs']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('playlist')
          : FirebaseFirestore.instance.collectionGroup('playlist');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('playlist').doc(id);

  static Stream<PlaylistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaylistRecord.fromSnapshot(s));

  static Future<PlaylistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaylistRecord.fromSnapshot(s));

  static PlaylistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PlaylistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaylistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaylistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaylistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaylistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaylistRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaylistRecordDocumentEquality implements Equality<PlaylistRecord> {
  const PlaylistRecordDocumentEquality();

  @override
  bool equals(PlaylistRecord? e1, PlaylistRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name && listEquality.equals(e1?.songs, e2?.songs);
  }

  @override
  int hash(PlaylistRecord? e) => const ListEquality().hash([e?.name, e?.songs]);

  @override
  bool isValidKey(Object? o) => o is PlaylistRecord;
}
