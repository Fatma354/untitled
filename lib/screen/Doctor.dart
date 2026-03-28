import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';

List<DrawerModel> doctorItems = [
  DrawerModel(title: "Home", icon: Icons.home_outlined),
  DrawerModel(title: "My Patients", icon: Icons.people_outline),
  DrawerModel(title: "Profile", icon: Icons.person_outline),
  DrawerModel(title: "Shop", icon: Icons.shopping_bag_outlined),
  DrawerModel(title: "Insulin Units", icon: Icons.medical_services_outlined),
  DrawerModel(title: "Blog", icon: Icons.article_outlined),
  DrawerModel(title: "Contact Us", icon: Icons.mail_outline),
  DrawerModel(title: "Company", icon: Icons.business_outlined),
];

class Doctor extends StatelessWidget {
  const Doctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/Dr. Ali Profile.png",
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Dr. Ali",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "DOCTOR",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ],
                  ),

                  const Spacer(),
                  const Icon(Icons.close, color: Colors.grey),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: doctorItems.length,
                itemBuilder: (context, index) {
                  final item = doctorItems[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xffE8F0FE)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(item.icon, color: Colors.blue),
                      title: Text(item.title),
                      trailing: const Icon(Icons.chevron_right, size: 18),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 16, top: 20),
              child: Text(
                "PRIMARY NAVIGATION",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ListTile(
                leading: const Icon(
                  Icons.settings_outlined,
                  color: Colors.blue,
                ),
                title: const Text("Settings"),
                trailing: const Icon(Icons.chevron_right, size: 18),
                onTap: () {},
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.blue),
                title: const Text("Logout"),
                trailing: const Icon(Icons.chevron_right, size: 18),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
