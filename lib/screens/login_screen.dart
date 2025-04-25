import 'package:flutter/material.dart';
import 'package:life_hero_app/utils/app_routes.dart';
import 'package:life_hero_app/utils/custom_bottom_navigation_bar.dart';
import 'package:life_hero_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Bar',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        leading:
            const Icon(Icons.add_ic_call_outlined, color: Colors.transparent),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              const Text(
                'motivation quote',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    field: "Username",
                    iconData: const Icon(Icons.person),
                    regExp: RegExp(r"^[A-Za-z]+$"),
                    limit: 40,
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    field: "Password",
                    iconData: const Icon(Icons.person),
                    regExp: RegExp(r"[A-Za-z\d@$!%*?&]"),
                    limit: 40,
                  )),
                ],
              ),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CustomBottomNavigationBar(
                                currentIndex: 0);
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    )),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUpPage);
                  },
                  child: const Text(
                    'Dont have an account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Text(
                'app version & copy right',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
