import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/controllers/auth_manager.dart';
import 'package:whatsapp_clone/screens/auth_screen.dart';
import 'package:whatsapp_clone/screens/users_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        )
      ],
      child: MaterialApp(
        title: 'WhatsUp',
        home: AuthScreen(),
        routes: {
          UsersScreen.routeName: (ctx) => UsersScreen(),
        },
      ),
    );
  }
}
