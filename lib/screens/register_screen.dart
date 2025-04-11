import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:life_hero_app/utils/app_routes.dart';

import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedGender;
  String? selectedBloodGroup = "A+";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  String _username = "";
  String _cnic = "";
  String _province = "";
  String _city = "";

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
                field: "Username",
                iconData: const Icon(Icons.person),
                regExp: RegExp("[A-Za-z]"),
                limit: 40,
                controller: _usernameController,
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.homePage);
                    log("Register Button Pressed");
                    log("Username: ${_usernameController.text}");
                    log("Cnic: ${_cnicController.text}");
                    log("Province: ${_provinceController.text}");
                    log("City: ${_cityController.text}");
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
