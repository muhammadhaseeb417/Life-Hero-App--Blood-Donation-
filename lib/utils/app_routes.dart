import 'package:flutter/material.dart';
import 'package:life_hero_app/screens/dashboard_screen.dart';
import 'package:life_hero_app/screens/home_page.dart';
import 'package:life_hero_app/screens/login_screen.dart';
import 'package:life_hero_app/screens/profile.dart';
import 'package:life_hero_app/screens/register_screen.dart';
import 'package:life_hero_app/screens/request_for_blood.dart';

class AppRoutes {
  static const String loginPage = "/login";
  static const String signUpPage = "/signup";
  static const String homePage = "/home";
  static const String requestForBloodPage = "/requestforblood";
  static const String dashboardPage = "/dashboard";
  static const String profilePage = "/profile";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      case AppRoutes.signUpPage:
        return MaterialPageRoute(
          builder: (context) {
            return const RegisterScreen();
          },
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      case AppRoutes.requestForBloodPage:
        return MaterialPageRoute(
          builder: (context) {
            return const RequestForBlood();
          },
        );
      case AppRoutes.dashboardPage:
        return MaterialPageRoute(
          builder: (context) {
            return const DashboardScreen();
          },
        );
      case AppRoutes.profilePage:
        return MaterialPageRoute(
          builder: (context) {
            return const Profile();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
