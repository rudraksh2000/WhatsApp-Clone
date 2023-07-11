import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat.dart';
import 'package:whatsapp_clone/models/messages.dart';
import 'package:whatsapp_clone/services/chat_service.dart';

class MessagesManager with ChangeNotifier {
  late TextEditingController chatText;
  late String dateOfLastMessage;
  late String type;
  late ChatService chatService;

  MessagesManager() {
    chatText = TextEditingController();
    dateOfLastMessage = "";
    type = "";
    chatService = ChatService();
  }

  Future<void> createMessage(String senderId, String recieverId) async {
    Chat chat = Chat(
      chatMessage: chatText.text,
      type: type,
      date: dateOfLastMessage,
      senderId: senderId,
    );
    await chatService.createChat(chat, senderId, recieverId, chatText.text);
  }

  Future<String> getLastMessage(String senderId, String recieverId) async {
    String lastMessage = await chatService.getLastMessage(senderId, recieverId);
    await chatService.getSenderId(senderId, recieverId);
    return lastMessage;
  }

  String getLastSenderId() {
    return chatService.getLastSenderId();
  }
}
