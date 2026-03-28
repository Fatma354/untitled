import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';
import 'package:untitled/screen/Edit_profile.dart';
import 'package:untitled/screen/insulin.dart';
import 'package:untitled/screen/next.dart';

import 'package:untitled/screen/doctor.dart';

class Custom extends StatelessWidget {
  Custom({super.key});

  final List<MenuItemModel> menuItems = [
    MenuItemModel(icon: Icons.home, title: "Home"),
    MenuItemModel(icon: Icons.favorite, title: "My Health"),
    MenuItemModel(icon: Icons.shopping_cart, title: "Profile"),
    MenuItemModel(icon: Icons.shopping_bag, title: "Insulin Units"),
    MenuItemModel(icon: Icons.person, title: "Top Doctors"),
    MenuItemModel(icon: Icons.video_call, title: "Tutorials"),

    MenuItemModel(
      icon: Icons.business,
      title: "Company",
      subItems: [
        SubMenuItemModel(title: "About Us"),
        SubMenuItemModel(title: "Our Mision"),
        SubMenuItemModel(title: "Careers"),
        SubMenuItemModel(title: "Press & Model"),
        SubMenuItemModel(title: "Contact Us"),
        SubMenuItemModel(title: "Blog"),
      ],
    ),
    MenuItemModel(
      icon: Icons.menu_book,
      title: "Resources",
      subItems: [
        SubMenuItemModel(title: "Monitoring Tools"),
        SubMenuItemModel(title: "Educational Games"),
        SubMenuItemModel(title: "FAQs"),
      ],
    ),
    MenuItemModel(
      icon: Icons.gavel,
      title: "Legal",
      subItems: [
        SubMenuItemModel(title: "Terms Of Service"),
        SubMenuItemModel(title: "Privacy policy"),
        SubMenuItemModel(title: "Medical Disclaimer"),
        SubMenuItemModel(title: "Cookie Policy"),
        SubMenuItemModel(title: "Compiance"),
        SubMenuItemModel(title: "Data Protections"),
      ],
    ),
    MenuItemModel(
      icon: Icons.article,
      title: "Blog",
      subItems: [
        SubMenuItemModel(title: "For Doctor"),
        SubMenuItemModel(title: "For Patient"),
      ],
    ),
    MenuItemModel(icon: Icons.settings, title: "Settings"),
    MenuItemModel(icon: Icons.logout, title: "Logout"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(14),
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/Container.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
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
                        "Ahmed Mohamed",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "UX/UI Designer",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ...menuItems.map((item) {
                Widget listTile = Container(
                  decoration: BoxDecoration(
                    color: item.title == "Home"
                        ? Colors.blue.shade50
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(item.icon, color: Colors.blue),
                    title: Text(
                      item.title,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.pop(context);
                      switch (item.title) {
                        case "Insulin Units":
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Insulin1()),
                          );
                          break;
                        case "Profile":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          );
                          break;
                        case "Top Doctors":
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Doctor()),
                          );
                          break;
                        case "Settings":
                          /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ),
                          );*/
                          break;
                        default:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextPage(title: item.title),
                            ),
                          );
                      }
                    },
                  ),
                );

                if (item.subItems != null && item.subItems!.isNotEmpty) {
                  return ExpansionTile(
                    leading: Icon(item.icon, color: Colors.blue),
                    title: Text(
                      item.title,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    children: item.subItems!.map((sub) {
                      return ListTile(
                        contentPadding: const EdgeInsets.only(left: 40),
                        title: Text(
                          sub.title,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                        onTap: () {
                          Navigator.pop(context);
                          switch (sub.title) {
                            case "About Us":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Insulin1(),
                                ),
                              );
                              break;
                            case "Contact Us":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Insulin1(),
                                ),
                              );
                              break;
                            case "Blog":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Insulin1(),
                                ),
                              );
                              break;
                            default:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NextPage(title: sub.title),
                                ),
                              );
                          }
                        },
                      );
                    }).toList(),
                  );
                }

                return listTile;
              }),
            ],
          ),
        ),
      ),
    );
  }
}
