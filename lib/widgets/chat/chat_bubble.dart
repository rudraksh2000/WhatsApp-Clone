// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:whatsapp_clone/utils/app_theme.dart';

class ChatBubble extends StatelessWidget {
  String chatText;
  String chatImage;
  bool isCurrentUser;
  ChatBubble({
    Key? key,
    this.chatText = "",
    this.chatImage = "",
    required this.isCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isCurrentUser) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppTheme.bgBlue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(chatText),
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppTheme.bgRed,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(chatText),
          ),
        ),
      );
    }
  }
}
