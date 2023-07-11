// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/auth.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Auth chatUser = ModalRoute.of(context)!.settings.arguments as Auth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.bgRed,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(chatUser.userProfileImage),
            ),
            SizedBox(
              width: 10,
            ),
            Text(chatUser.userName),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(userId: chatUser.userId),
            ),
            NewMessage(userId: chatUser.userId),
          ],
        ),
      ),
    );
  }
}
