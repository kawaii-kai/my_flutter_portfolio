import 'package:flutter/material.dart';
import 'package:my_portfolio/config/routes/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        fontFamily: 'Inter', 
      ),
      routerConfig: AppRouter.router,
    );
  }
}
