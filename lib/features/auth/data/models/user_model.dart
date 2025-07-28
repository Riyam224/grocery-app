// ignore_for_file: annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uId,
    required super.email,
    required super.phoneNumber,
  }) : super(
         name: '',
         address: '',
         city: '',
         zipcode: '',
         country: '',
         image: '',
       );

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(email: user.email ?? '', uId: user.uid, phoneNumber: '');
  }

// todo to use it in fetch USER data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      phoneNumber: user.phoneNumber,
      email: user.email,

      uId: user.uId,
    );
  }
  toMap() {
    return {'phoneNumber': phoneNumber, 'email': email, 'uId': uId};
  }
}
