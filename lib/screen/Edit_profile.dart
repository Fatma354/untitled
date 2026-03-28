import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final List<ProfileField> profileFields = [
    ProfileField(label: "First Name", hint: "John", icon: Icons.person_outline),
    ProfileField(label: "Last Name", hint: "Doe", icon: Icons.person_outline),
    ProfileField(
      label: "Phone Number",
      hint: "+1 (555) 123-4567",
      icon: Icons.phone,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(237, 255, 255, 255),
      body: Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),

                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      backgroundImage: AssetImage("assets/Edit.png"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  "Change Profile Picture",
                  style: TextStyle(color: Colors.orange, fontSize: 13),
                ),

                const SizedBox(height: 25),
                ...profileFields.map((field) {
                  return Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: field.label,
                          hintText: field.hint,
                          suffixIcon: Icon(field.icon),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  );
                }),

                const SizedBox(height: 25),

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
                          "Save Changes",
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
      ),
    );
  }
}
//===========