import 'package:flutter/material.dart';
import 'package:my_portfolio/core/theme/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
            routerConfig: appRouter,
            title: 'Okane Bank',
            debugShowCheckedModeBanner: false,
          );
  }
}
