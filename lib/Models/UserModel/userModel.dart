import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String id;
  String username;
  String email;
  String phone;
  String bio;
  String city;
  String dob;
  String createdAt;
  bool isVerified;
  String fcmToken;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.bio,
    this.dob,
    this.city,
    this.createdAt,
    this.isVerified,
    this.fcmToken,
  });

  UserModel.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    email = snapshot.value["email"];
    dob = snapshot.value["dob"];
    city = snapshot.value["city"];
    phone = snapshot.value["phone"];
    createdAt = snapshot.value["createdAt"];
    username = snapshot.value["username"];
    fcmToken = snapshot.value["fcmToken"];
    isVerified = snapshot.value["isVerified"] ?? false;
  }
  toMap() {
    return {
      "id": id,
      "email": email,
      'phone': phone,
      'dob': dob,
      'city': city,
      'createdAt': createdAt,
      'username': username,
      'isVerified': isVerified ?? false,
      'fcmToken': fcmToken,
    };
  }

  UserModel copyWith({
    String email,
    String id,
    String profilePic,
    String key,
    String phone,
    String dob,
    String city,
    String createdAt,
    String username,
    String webSite,
    bool isVerified,
    String fcmToken,
    String product,
    String productPic,
    String isDonate,
  }) {
    return UserModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      dob: dob ?? this.dob,
      isVerified: isVerified ?? this.isVerified,
      city: city ?? this.city,
      id: id ?? this.id,
      username: username ?? this.username,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
