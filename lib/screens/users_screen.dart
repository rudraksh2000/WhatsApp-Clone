import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/auth.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';
import 'package:whatsapp_clone/widgets/auth/auth_form.dart';
import 'package:whatsapp_clone/widgets/chat/chat_user.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});
  static const routeName = '/users';

  @override
  Widget build(BuildContext context) {
    final userCredentials = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hi $userCredentials"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.nearlyRed),
                ),
              );
            } else {
              if (snapshot.data!.size <= 1) {
                return SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  if (snapshot.data?.docs[index].get('userName') !=
                      userCredentials) {
                    log(index.toString());
                    return ChatUser(
                      userName: snapshot.data?.docs[index].get('userName'),
                    );
                  }
                },
                itemCount: snapshot.data?.docs.length,
              );
            }
          },
        ),
      ),
    );
  }
}
