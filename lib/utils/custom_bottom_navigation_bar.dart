import 'package:flutter/material.dart';
import 'package:life_hero_app/screens/dashboard_screen.dart';
import 'package:life_hero_app/screens/home_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePage(),
      const HomePage(),
      const DashboardScreen(),
      const HomePage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CustomBottomNavigationBar(currentIndex: 0);
                },
              ),
            );
          } else if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CustomBottomNavigationBar(currentIndex: 1);
                },
              ),
            );
          } else if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CustomBottomNavigationBar(currentIndex: 2);
                },
              ),
            );
          } else if (value == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const CustomBottomNavigationBar(currentIndex: 3);
                },
              ),
            );
          }
        },
      ),
      body: pages[currentIndex],
    );
  }
}
