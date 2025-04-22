import 'package:flutter/material.dart';
import 'package:life_hero_app/utils/app_routes.dart';
import 'package:life_hero_app/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Life Hero App",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginPage,
      onGenerateRoute: AppRoutes.generateRoutes,
    );
  }
}
