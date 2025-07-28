// Abstract interface
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/features/auth/data/models/user_model.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';

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

  //  todo get user data

  Future<UserEntity> getUserData({required String uId, required String path});
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
  Future<UserEntity> getUserData({
    required String uId,
    required String path,
  }) async {
    var data = await firestore.collection(path).doc(uId).get();
    return UserModel.fromJson(data.data() as Map<String, dynamic>);
  }
}
