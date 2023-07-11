// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/controllers/messages_manager.dart';
import 'package:whatsapp_clone/controllers/users_manager.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';

class NewMessage extends StatefulWidget {
  final String userId;
  const NewMessage({super.key, required this.userId});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    final senderId =
        Provider.of<UsersManager>(context, listen: false).currentUserId;
    return Consumer<MessagesManager>(builder: (context, chatManager, child) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppTheme.nearlyGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: chatManager.chatText,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Enter the message",
                  labelStyle: TextStyle(color: AppTheme.nearlyWhite),
                  fillColor: AppTheme.darkGrey,
                ),
                cursorColor: AppTheme.darkGrey,
              ),
            ),
            IconButton(
              onPressed: () async {
                chatManager.dateOfLastMessage = DateTime.now().toString();
                chatManager.type = "text";
                await chatManager.createMessage(senderId, widget.userId);
                chatManager.chatText.clear();
              },
              icon: Icon(Icons.send),
            )
          ],
        ),
      );
    });
  }
}
