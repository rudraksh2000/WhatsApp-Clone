// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    //File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      print(_userEmail);
      print(_userName);
      print(_userPassword);
      widget.submitFn(
        _userEmail,
        _userName,
        _userPassword,
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (!_isLogin) UserImagePicker(),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the email address.";
                      } else if (!value.contains('@') ||
                          !value.contains('.') ||
                          value.indexOf('@') > value.indexOf('.') ||
                          value.startsWith('@') ||
                          value.endsWith('@') ||
                          value.startsWith('.') ||
                          value.endsWith('.')) {
                        return "Please enter a valid email address.";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Enter your email"),
                    onSaved: (newValue) {
                      _userEmail = newValue!;
                    },
                  ),
                  SizedBox(),
                  if (!_isLogin)
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the username.";
                        } else if (value.length <= 8) {
                          return "Username must have at least 8 charecters.";
                        }
                        return null;
                      },
                      decoration:
                          InputDecoration(hintText: "Enter your username"),
                      onSaved: (newValue) {
                        _userName = newValue!;
                      },
                    ),
                  SizedBox(),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the password.";
                      } else if (value.length <= 6) {
                        return "Password must have at least 6 charecters.";
                      }
                      return null;
                    },
                    decoration:
                        InputDecoration(hintText: "Enter your password"),
                    obscureText: true,
                    onSaved: (newValue) {
                      _userPassword = newValue!;
                    },
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                        _isLogin ? 'Create new account' : 'Already a user'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
