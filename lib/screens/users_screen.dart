import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/controllers/toast_manager.dart';
import 'package:whatsapp_clone/controllers/users_manager.dart';
import 'package:whatsapp_clone/models/auth.dart';
import 'package:whatsapp_clone/models/users.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';
import 'package:whatsapp_clone/widgets/auth/auth_form.dart';
import 'package:whatsapp_clone/widgets/users/chat_user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});
  static const routeName = '/users';

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    final AuthScreenArguments userCredentials =
        ModalRoute.of(context)!.settings.arguments as AuthScreenArguments;
    final emailId = userCredentials.email;
    final password = userCredentials.password;

    final usersData = Provider.of<UsersManager>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.bgRed,
          leading: CircleAvatar(
            radius: 5,
            backgroundImage:
                NetworkImage(usersData.data!.user.userProfileImage),
          ),
          // FutureBuilder(
          //   future: usersData.getUserDetails(emailId, password),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       if (snapshot.hasData) {
          //         return Padding(
          //           padding: const EdgeInsets.all(5.0),
          //           child: CircleAvatar(
          //             radius: 5,
          //             backgroundImage: NetworkImage(
          //                 (snapshot.data as Users).user.userProfileImage),
          //           ),
          //         );
          //       } else {
          //         return const CircleAvatar(
          //           backgroundImage: AssetImage('assets/images/default.png'),
          //         );
          //       }
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),

          title: Text("Hi ${usersData.data!.user.userName}"),

          // FutureBuilder(
          //   future: usersData.getUserDetails(emailId, password),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       if (snapshot.hasData) {
          //         var userName = (snapshot.data as Users).user.userName;
          //         return Padding(
          //           padding: const EdgeInsets.all(5.0),
          //           child: Text("Hi $userName"),
          //         );
          //       }
          //     }
          //     return const Text("Hi User");
          //   },
          // ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        //streambuilder
        body: FutureBuilder<List<Users>>(
          future: usersData.getAllUsers(emailId, password),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ChatUser(user: (snapshot.data![index]).user),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }
            return Image.asset('assets/images/waiting.png');
          },
        ));
  }
}
