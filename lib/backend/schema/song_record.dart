import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SongRecord extends FirestoreRecord {
  SongRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "artist" field.
  String? _artist;
  String get artist => _artist ?? '';
  bool hasArtist() => _artist != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  bool hasLength() => _length != null;

  // "album" field.
  String? _album;
  String get album => _album ?? '';
  bool hasAlbum() => _album != null;

  // "cover" field.
  String? _cover;
  String get cover => _cover ?? '';
  bool hasCover() => _cover != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _artist = snapshotData['artist'] as String?;
    _name = snapshotData['name'] as String?;
    _length = castToType<int>(snapshotData['length']);
    _album = snapshotData['album'] as String?;
    _cover = snapshotData['cover'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('song')
          : FirebaseFirestore.instance.collectionGroup('song');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('song').doc(id);

  static Stream<SongRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SongRecord.fromSnapshot(s));

  static Future<SongRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SongRecord.fromSnapshot(s));

  static SongRecord fromSnapshot(DocumentSnapshot snapshot) => SongRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SongRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SongRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SongRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SongRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSongRecordData({
  String? artist,
  String? name,
  int? length,
  String? album,
  String? cover,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'artist': artist,
      'name': name,
      'length': length,
      'album': album,
      'cover': cover,
    }.withoutNulls,
  );

  return firestoreData;
}

class SongRecordDocumentEquality implements Equality<SongRecord> {
  const SongRecordDocumentEquality();

  @override
  bool equals(SongRecord? e1, SongRecord? e2) {
    return e1?.artist == e2?.artist &&
        e1?.name == e2?.name &&
        e1?.length == e2?.length &&
        e1?.album == e2?.album &&
        e1?.cover == e2?.cover;
  }

  @override
  int hash(SongRecord? e) => const ListEquality()
      .hash([e?.artist, e?.name, e?.length, e?.album, e?.cover]);

  @override
  bool isValidKey(Object? o) => o is SongRecord;
}
