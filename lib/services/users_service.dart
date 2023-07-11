import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_clone/models/users.dart';

import '../models/auth.dart';

class UsersService {
  late CollectionReference _authCollection;
  final db = FirebaseFirestore.instance;

  Future<Users> getUsersDetails(String email, String password) async {
    final snapshot = await db
        .collection('users')
        .where('userEmail', isEqualTo: email)
        .where('userPassword', isEqualTo: password)
        .get();
    final data = snapshot.docs.map((e) => Users.fromSnapShot(e)).single;
    return data;
  }

  Future<List<Users>> getAllUsersDetails(String email, String password) async {
    final snapshot = await db
        .collection('users')
        .where('userEmail', isNotEqualTo: email)
        .get();
    final data = snapshot.docs.map((e) => Users.fromSnapShot(e)).toList();
    return data;
  }
}
