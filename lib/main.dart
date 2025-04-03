import 'package:flutter/material.dart';
import 'package:practice_deeplink/pages/green_page.dart';
import 'package:practice_deeplink/pages/home_page.dart';
import 'package:practice_deeplink/pages/orange_page.dart';
import 'package:practice_deeplink/pages/red_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // navigatorKey: ContextUtilityService.navigatorKey,
      initialRoute: '/',
      routes: {
        '/' : (context)=> HomePage(),
        '/red-page': (context)=> RedPage(),
        '/green-page': (context)=> GreenPage(),
        '/orange-page': (context)=> OrangePage(),
      },
    );
  }
}
