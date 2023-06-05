// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  String userId;
  String userEmail;
  String userName;
  String userPassword;
  String userProfileImage;
  Auth({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userPassword,
    required this.userProfileImage,
  });

  Auth copyWith({
    String? userId,
    String? userEmail,
    String? userName,
    String? userPassword,
    String? userProfileImage,
  }) {
    return Auth(
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
      userProfileImage: userProfileImage ?? this.userProfileImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userEmail': userEmail,
      'userName': userName,
      'userPassword': userPassword,
      'userProfileImage': userProfileImage,
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      userId: map['userId'] as String,
      userEmail: map['userEmail'] as String,
      userName: map['userName'] as String,
      userPassword: map['userPassword'] as String,
      userProfileImage: map['userProfileImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Auth(userId: $userId, userEmail: $userEmail, userName: $userName, userPassword: $userPassword, userProfileImage: $userProfileImage)';
  }

  @override
  bool operator ==(covariant Auth other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.userEmail == userEmail &&
        other.userName == userName &&
        other.userPassword == userPassword &&
        other.userProfileImage == userProfileImage;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        userEmail.hashCode ^
        userName.hashCode ^
        userPassword.hashCode ^
        userProfileImage.hashCode;
  }
}
