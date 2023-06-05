import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/header_name.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';
import 'package:whatsapp_clone/widgets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeaderName(),
                const SizedBox(
                  height: 30,
                ),
                AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
