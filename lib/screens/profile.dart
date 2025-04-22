import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController bioController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: const Center(
                    child: Icon(Icons.person, size: 110),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Muhammad Haseeb Amjad",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  "@mhhaseeb417",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 10),
                const Text(
                    textAlign: TextAlign.center,
                    "I am a Flutter Developer, also a student at Uet Lahore"),
                const SizedBox(height: 30),
                TextFormField(
                  controller: bioController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.info),
                    hintText: "something about your ...",
                    labelText: "Bio",
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print("Bio Value :${bioController.text}");
                      }
                      bioController.clear();
                    },
                    child: const Text("Save"))
              ],
            ),
          ),
        ));
  }
}
