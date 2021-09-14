import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection =
    _firestore.collection('notification');

class Database {
  // static String? userUid;

  static Future<void> addItem({
    required String uid,
    required String title,
    required String description,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(uid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("notification item added to the database"))
        .catchError((e) => print(e));
  }
}
