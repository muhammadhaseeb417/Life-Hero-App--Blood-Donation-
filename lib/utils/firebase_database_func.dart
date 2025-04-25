import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseFunc {
  // FirebaseDatabase instance
  static final DatabaseReference db =
      FirebaseDatabase.instance.ref("lifehero_db");

  // Method to get data from the database
  void getData() {
    // Implementation for getting data from the database
  }

  // Method to set data in the database
  void setData({required Map<String, dynamic> userData}) async {
    try {
      await db.push().set(userData);
      log("Data saved successfully: ${userData['email']}");
    } catch (e) {
      log("Error saving data: $e");
      // Consider throwing the error to handle it upstream
    }
  }
}
