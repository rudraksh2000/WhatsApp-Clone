// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/auth_screen.dart';
import './screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(
          secondary: Colors.green,
        ),
        //fontFamily: 'Aloevera',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Hindya',
                fontSize: 60,
                color: Colors.lightGreenAccent,
              ),
            ),
      ),
      home: AuthScreen(),
    );
  }
}
