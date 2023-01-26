import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String email;
  String password;
  String userName;
//  File image;

  AuthProvider(
    this.email,
    this.password,
    this.userName,
  );
}
