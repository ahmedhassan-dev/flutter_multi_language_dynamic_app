// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; // Generated file

@JsonSerializable()
class UserModel {
  final String fullName;
  final String username;
  final String password;
  final String email;
  final String phone;
  final String userType; // Admin or User

  UserModel({
    required this.fullName,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.userType,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
