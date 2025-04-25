import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_hero_app/utils/app_routes.dart';
import 'package:life_hero_app/utils/user_auth.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/custom_bottom_navigation_bar.dart'
    show CustomBottomNavigationBar;
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedGender;
  String? selectedBloodGroup = "A+";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  // String _username = "";
  // String _cnic = "";
  // String _province = "";
  // String _city = "";

  Future<bool> saveData(String data) async {
    try {
      if (kIsWeb) {
        // Web implementation (using localStorage or IndexedDB)
        // For simple testing, you can use print statements
        log("Web platform detected, data would be saved: $data");
        return true;
      } else {
        // Mobile implementation
        Directory documents = await getApplicationDocumentsDirectory();
        File f = File('${documents.path}/data.json');
        await f.writeAsString(data);
        return true;
      }
    } catch (e) {
      log("Error writing to file: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                field: "Email",
                iconData: const Icon(Icons.person),
                regExp: RegExp(r'[a-zA-Z0-9@._-]'),
                limit: 40,
                controller: _emailController,
              ),
              CustomTextField(
                field: "Password",
                iconData: const Icon(Icons.person),
                regExp: RegExp(r"[A-Za-z\d@$!%*?&]"),
                limit: 40,
                controller: _passwordController,
              ),
              CustomTextField(
                field: "Cnic",
                iconData: const Icon(Icons.person),
                regExp: RegExp("[0-9]"),
                limit: 13,
                controller: _cnicController,
              ),
              Column(
                children: [
                  const Text(
                    'Date of Birth',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        showDateDialog();
                      },
                      child: const Text('Select Date')),
                ],
              ),
              const SizedBox(width: 20),
              RadioMenuButton<String>(
                value: "male",
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                child: const Text("Male"),
              ),
              RadioMenuButton<String>(
                value: "female",
                groupValue: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                child: const Text("Female"),
              ),
              CustomTextField(
                field: "Province",
                iconData: const Icon(Icons.person),
                regExp: RegExp("[A-Za-z]"),
                limit: 20,
                controller: _provinceController,
              ),
              Row(
                children: [
                  const Text(
                    'Select Blood Group',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(width: 20),
                  DropdownButton(
                    value: selectedBloodGroup,
                    items: const [
                      DropdownMenuItem(
                        value: "A+",
                        child: Text('A+'),
                      ),
                      DropdownMenuItem(value: "A-", child: Text('A-')),
                      DropdownMenuItem(value: "B+", child: Text('B+')),
                      DropdownMenuItem(value: "B-", child: Text('B-')),
                      DropdownMenuItem(value: "AB+", child: Text('B-')),
                      DropdownMenuItem(value: "AB-", child: Text('B-')),
                      DropdownMenuItem(value: "O+", child: Text('B-')),
                      DropdownMenuItem(value: "O-", child: Text('B-')),
                    ],
                    onChanged: (value) {
                      selectedBloodGroup = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              CustomTextField(
                field: "City",
                iconData: const Icon(Icons.person),
                regExp: RegExp("[A-Za-z]"),
                limit: 20,
                controller: _cityController,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> data = {
                      "email": _emailController.text,
                      "password": _passwordController.text,
                      "cnic": _cnicController.text,
                      "province": _provinceController.text,
                      "city": _cityController.text,
                      "bloodgroup": selectedBloodGroup!,
                      "gender": selectedGender, // Add this
                    };
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields'),
                        ),
                      );
                      return;
                    } else {
                      final result = await UserAuth.signup(userData: data);
                      if (result == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CustomBottomNavigationBar(
                                  currentIndex: 0);
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login successful'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login failed'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDateDialog() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      // Handle the selected date
    }
  }
}
