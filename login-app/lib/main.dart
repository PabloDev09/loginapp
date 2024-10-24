import 'package:flutter/material.dart';
import 'package:loginapp/config/themes/app_theme.dart';
import 'package:loginapp/config/routes/go_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        routerConfig: router,
    );
  }
}