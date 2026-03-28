import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';

class Chang extends StatelessWidget {
  Chang({super.key});

  final List<ProfileField> profileFields = [
    ProfileField(
      label: "Enter old password",
      hint: "Enter old password",
      icon: Icons.visibility,
    ),
    ProfileField(
      label: "Enter new password",
      hint: "Enter new password",
      icon: Icons.visibility,
    ),
    ProfileField(
      label: "Confirm new password",
      hint: "Confirm new password",
      icon: Icons.visibility,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء للشاشة كاملة
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 10),
                  Text(
                    "Change Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Your new password must be different from your \npreviously used passwords",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 32),

              ...profileFields.map((field) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: field.label,
                      hintText: field.hint,
                      suffixIcon: Icon(field.icon),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                );
              }).toList(),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2f66d0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Update Password",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
