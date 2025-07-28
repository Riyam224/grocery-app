// Abstract interface
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseService {
  // todo add data
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    // todo add this for check for not  null data
    String? documentId,
  });

  // todo  update data
  Future<void> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> newData,
  });

  //  todo get user data ______________
  Future<Map<String, dynamic>> getUserData({
    required String documentId,
    required String path,
  });

  // todo for social , check if the data exist
  Future<bool> checkIfDataExist({
    required String path,
    required String documentId,
  });
}

// todo FirestoreService Implementation __________________________________

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    }
    await firestore.collection(path).add(data);
  }

  @override
  Future<void> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> newData,
  }) async {
    await firestore.collection(path).doc(docId).update(newData);
  }

  @override
  Future<Map<String, dynamic>> getUserData({
    required String documentId,
    required String path,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }

  // todo check in imple

  @override
  Future<bool> checkIfDataExist({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
