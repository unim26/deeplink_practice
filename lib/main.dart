import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:practice_deeplink/pages/green_page.dart';
import 'package:practice_deeplink/pages/home_page.dart';
import 'package:practice_deeplink/pages/orange_page.dart';
import 'package:practice_deeplink/pages/red_page.dart';
import 'package:practice_deeplink/services/context_utility_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  void initState() {
  super.initState();

  final AppLinks appLinks = AppLinks();

  // Handle incoming deep links while app is running
  appLinks.uriLinkStream.listen((uri) {
    handleDeepLink(uri);
  });

  // Handle deep link when app is first launched
  Future.delayed(Duration.zero, () async {
    final Uri? initialUri = await appLinks.getInitialLink();
    if (initialUri != null) {
      handleDeepLink(initialUri);
    }
  });
}

void handleDeepLink(Uri uri) {
  final Map<String, String> params = uri.queryParameters;
  final String? page = params['page'];

  print("Uri received: $page");

  if (page != null) {
    ContextUtilityService.navigatorKey.currentState?.pushNamed('/$page');
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtilityService.navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/red-page': (context) => RedPage(),
        '/green-page': (context) => GreenPage(),
        '/orange-page': (context) => OrangePage(),
      },
    );
  }
}
