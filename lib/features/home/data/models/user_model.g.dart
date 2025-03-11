// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullName'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'phone': instance.phone,
      'userType': instance.userType,
    };
