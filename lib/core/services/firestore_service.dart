// Abstract interface
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseService {

  // todo add data 
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

// todo  update data
  Future<void> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> newData,
  });

  Future<void> deleteData({required String path, required String docId});

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser({
    required String path,
    required String docId,
  });
}

// todo FirestoreService Implementation

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
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
  Future<void> deleteData({required String path, required String docId}) async {
    await firestore.collection(path).doc(docId).delete();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser({
    required String path,
    required String docId,
  }) async {
    return await firestore.collection(path).doc(docId).get();
  }
}
