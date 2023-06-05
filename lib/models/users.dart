// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone/models/auth.dart';

class Users {
  String id;
  Auth user;
  Users({
    required this.id,
    required this.user,
  });

  Users copyWith({
    String? id,
    Auth? user,
  }) {
    return Users(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['id'] as String,
      user: Auth.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) =>
      Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Users(id: $id, user: $user)';

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;

    return other.id == id && other.user == user;
  }

  @override
  int get hashCode => id.hashCode ^ user.hashCode;

  factory Users.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Users(
      id: document.id,
      user: Auth(
          userId: data['userId'],
          userEmail: data['userEmail'],
          userName: data['userName'],
          userPassword: data['userPassword'],
          userProfileImage: data['userProfileImage']),
    );
  }
}
