import 'package:flutter/material.dart';

import 'app_routes.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Haseeb Amjad'),
            accountEmail: Text('haseeb@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            otherAccountsPictures: [
              Icon(Icons.settings, size: 30),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.homePage,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.homePage,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.dashboardPage,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.homePage,
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
