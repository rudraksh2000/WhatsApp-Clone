// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whatsapp_clone/controllers/auth_manager.dart';
import 'package:whatsapp_clone/screens/users_screen.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';
import 'package:whatsapp_clone/widgets/auth/form_field_user.dart';
import 'package:whatsapp_clone/widgets/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  File? _pickedImage;
  var _isLogin = false;

  void _selectImage(File pickedImage) {
    //log(pickedImage.path);
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthManager>(
      builder: (context, authManager, child) {
        return Container(
          height: _isLogin ? 270 : 480,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.bgRed,
            borderRadius: BorderRadius.circular(5),
            //border: Border.all(width: 2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (!_isLogin) UserImagePicker(_selectImage),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormFieldUser(
                        fieldText: "Email Id",
                        controller: authManager.emailId,
                        hintText: "Enter email Id",
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        isPassword: false,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Email Id cannot be empty!";
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(p0);
                          if (!emailValid) {
                            return "Email Id is not valid";
                          }
                          return null;
                        },
                      ),
                      if (!_isLogin)
                        FormFieldUser(
                          fieldText: "Username",
                          controller: authManager.userName,
                          hintText: "Enter username",
                          inputType: TextInputType.text,
                          inputAction: TextInputAction.next,
                          isPassword: false,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Username cannot be empty!";
                            }
                            return null;
                          },
                        ),
                      FormFieldUser(
                        fieldText: "Password",
                        controller: authManager.userPassword,
                        hintText: "Enter password",
                        inputType: TextInputType.text,
                        inputAction: TextInputAction.next,
                        isPassword: true,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Password cannot be empty!";
                          } else if (p0.length < 8) {
                            return "Password should contain 8 charecters!";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          // final isValid = _formKey.currentState!.validate();
                          FocusScope.of(context).unfocus();
                          if (_isLogin) {
                            String isValid = await authManager.loginUser(
                              userEmail: authManager.emailId.text,
                              userPassword: authManager.userPassword.text,
                            );
                            log(isValid);
                            if (isValid.toString() == 'Signed In') {
                              Navigator.of(context).pushNamed(
                                  UsersScreen.routeName,
                                  arguments: authManager.userName.text);
                            }
                          } else {
                            if (_formKey.currentState!.validate()) {
                              authManager.submitUserCredentials(
                                image: _pickedImage!,
                              );
                              Navigator.of(context).pushNamed(
                                  UsersScreen.routeName,
                                  arguments: authManager.userName.text);
                              return _formKey.currentState!.save();
                            }
                            return;
                          }
                        },
                        style: AppTheme.btnStyleCard,
                        child: Text(
                          _isLogin ? "Login" : "Create user",
                          style: AppTheme.btnText,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin ? "Create user" : "Already a user",
                          style: AppTheme.btnTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AuthScreenArguments {
  final String userId;
  final String userName;

  AuthScreenArguments(
    this.userId,
    this.userName,
  );
}
