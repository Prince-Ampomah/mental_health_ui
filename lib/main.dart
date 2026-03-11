import 'package:flutter/material.dart';
import 'package:mental_health_ui/core/theme/app_theme.dart';
import 'package:mental_health_ui/routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mental Health UI',
      theme: customLightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
