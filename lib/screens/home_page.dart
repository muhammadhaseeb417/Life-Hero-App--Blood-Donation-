import 'package:flutter/material.dart';
import 'package:life_hero_app/utils/app_routes.dart';
import 'package:life_hero_app/utils/custom_app_drawer.dart';
import 'package:life_hero_app/widgets/info_widget.dart';
import 'package:life_hero_app/widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> bloodTypes = {
      "A+": "assets/images/a-plus.png",
      "A-": "assets/images/a-neg.png",
      "B+": "assets/images/b-plus.png",
      "B-": "assets/images/b-neg.png",
      "AB+": "assets/images/ab-plus.png",
      "AB-": "assets/images/ab-neg.png",
      "O+": "assets/images/o-plus.png",
      "O-": "assets/images/o-neg.png",
    };

    Map<String, String> recentPosts = {
      "Who can give blood": "assets/images/post1.jpg",
      "Donate Now": "assets/images/post2.jpg",
    };

    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const CustomAppDrawer(),
      appBar: AppBar(
        title: const Text(
          'Life Hero',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 30),
          Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: const Text(
                'Let\'s save blood!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.requestForBloodPage,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Request For Blood',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.dashboardPage,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.75,
            ),
            itemCount: bloodTypes.length,
            itemBuilder: (context, index) {
              return InfoWidget(
                title: "Blood Type",
                subtitle: bloodTypes.keys.elementAt(index),
                iconData: Icons.bloodtype,
                imgPath: bloodTypes.values.elementAt(index),
              );
            },
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'Blood Donation Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InfoWidget(
                title: "Total Donors",
                subtitle: "1,245",
                iconData: Icons.people,
                imgPath: '',
              ),
              InfoWidget(
                title: "Lives Saved",
                subtitle: "3,735",
                iconData: Icons.favorite,
                imgPath: '',
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Recent Post',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.builder(
              itemCount: recentPosts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PostWidget(
                  title: recentPosts.keys.elementAt(index),
                  imgPath: recentPosts.values.elementAt(index),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
