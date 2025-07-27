import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uId;
  final String? name;
  final String email;
  final String? address;
  final String? city;
  final String? zipcode;
  final String? country;
  final String phoneNumber;
  final String? image;

  const UserEntity({
    required this.uId,
    this.name,
    required this.email,
    this.address,
    this.city,
    this.zipcode,
    this.country,
    required this.phoneNumber,
    this.image,
  });

  @override
  List<Object?> get props => [uId, email, phoneNumber];
}
