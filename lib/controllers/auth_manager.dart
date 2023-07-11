import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/services/storage_service.dart';
import 'package:whatsapp_clone/controllers/toast_manager.dart';
import 'package:whatsapp_clone/models/auth.dart';
import 'package:whatsapp_clone/services/auth_service.dart';

class AuthManager with ChangeNotifier {
  late TextEditingController emailId;
  late TextEditingController userPassword;
  late TextEditingController userName;
  late String userProfileImage;
  late String userId;

  late AuthService authService;

//  File image;

  AuthManager() {
    emailId = TextEditingController();
    userPassword = TextEditingController();
    userName = TextEditingController();
    authService = AuthService();
    userProfileImage = "";
    userId = "";
  }

  void submitUserCredentials({
    required File image,
  }) async {
    userId = await authService.generateNewAuthId();
    userProfileImage = await StorageService().getUserProfileImage(
      userId: userId,
      fileName: image,
    );
    Auth auth = Auth(
      userId: userId,
      userEmail: emailId.text.trim(),
      userName: userName.text.trim(),
      userPassword: userPassword.text,
      userProfileImage: userProfileImage,
    );
    await authService.signUp(auth: auth).then((value) {
      ToastManager().successToast(value!);
      emailId = TextEditingController();
      userName = TextEditingController();
      userPassword = TextEditingController();
    });
  }

  Future<String> loginUser({
    required String userEmail,
    required String password,
  }) async {
    String validUser = "";
    await authService
        .signIn(
      emailId: userEmail,
      password: password,
    )
        .then((value) {
      ToastManager().successToast(value!);
      validUser = value;
      emailId = TextEditingController();
      userPassword = TextEditingController();
    });
    log(validUser);
    return validUser;
  }

  @override
  void dispose() {
    emailId = TextEditingController();
    userPassword = TextEditingController();
    userName = TextEditingController();
    authService = AuthService();
    userProfileImage = "";
    userId = "";
    super.dispose();
  }
}
