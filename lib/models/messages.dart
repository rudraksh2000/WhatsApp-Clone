// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:whatsapp_clone/models/chat.dart';

class Messages {
  List<Chat> chatMessage;
  String senderId;
  String lastMessage;
  Messages({
    required this.chatMessage,
    required this.senderId,
    required this.lastMessage,
  });
  

  Messages copyWith({
    List<Chat>? chatMessage,
    String? senderId,
    String? lastMessage,
  }) {
    return Messages(
      chatMessage: chatMessage ?? this.chatMessage,
      senderId: senderId ?? this.senderId,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatMessage': chatMessage.map((x) => x.toMap()).toList(),
      'senderId': senderId,
      'lastMessage': lastMessage,
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      chatMessage: List<Chat>.from((map['chatMessage'] as List<int>).map<Chat>((x) => Chat.fromMap(x as Map<String,dynamic>),),),
      senderId: map['senderId'] as String,
      lastMessage: map['lastMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Messages.fromJson(String source) => Messages.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Messages(chatMessage: $chatMessage, senderId: $senderId, lastMessage: $lastMessage)';

  @override
  bool operator ==(covariant Messages other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.chatMessage, chatMessage) &&
      other.senderId == senderId &&
      other.lastMessage == lastMessage;
  }

  @override
  int get hashCode => chatMessage.hashCode ^ senderId.hashCode ^ lastMessage.hashCode;
}
