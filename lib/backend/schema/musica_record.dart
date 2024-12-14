import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusicaRecord extends FirestoreRecord {
  MusicaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nowPlaying" field.
  DocumentReference? _nowPlaying;
  DocumentReference? get nowPlaying => _nowPlaying;
  bool hasNowPlaying() => _nowPlaying != null;

  // "playlists" field.
  List<DocumentReference>? _playlists;
  List<DocumentReference> get playlists => _playlists ?? const [];
  bool hasPlaylists() => _playlists != null;

  void _initializeFields() {
    _nowPlaying = snapshotData['nowPlaying'] as DocumentReference?;
    _playlists = getDataList(snapshotData['playlists']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('musica');

  static Stream<MusicaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MusicaRecord.fromSnapshot(s));

  static Future<MusicaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MusicaRecord.fromSnapshot(s));

  static MusicaRecord fromSnapshot(DocumentSnapshot snapshot) => MusicaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MusicaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MusicaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MusicaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MusicaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMusicaRecordData({
  DocumentReference? nowPlaying,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nowPlaying': nowPlaying,
    }.withoutNulls,
  );

  return firestoreData;
}

class MusicaRecordDocumentEquality implements Equality<MusicaRecord> {
  const MusicaRecordDocumentEquality();

  @override
  bool equals(MusicaRecord? e1, MusicaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nowPlaying == e2?.nowPlaying &&
        listEquality.equals(e1?.playlists, e2?.playlists);
  }

  @override
  int hash(MusicaRecord? e) =>
      const ListEquality().hash([e?.nowPlaying, e?.playlists]);

  @override
  bool isValidKey(Object? o) => o is MusicaRecord;
}
