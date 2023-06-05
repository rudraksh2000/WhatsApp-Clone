import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/app_theme.dart';

class HeaderName extends StatelessWidget {
  const HeaderName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'WhatsUp',
      style: AppTheme.mainHeader,
    );
  }
}
