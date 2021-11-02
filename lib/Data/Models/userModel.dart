import 'dart:convert';

import 'package:hive/hive.dart';
part 'userModel.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String accessToken;

  UserModel({required this.email, required this.accessToken});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'accessToken': accessToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      accessToken: map['accessToken'],
    );
  }
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
