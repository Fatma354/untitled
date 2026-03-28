import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart'; // SecurityItem

class Setting extends StatelessWidget {
  Setting({super.key});

  final List<SecurityItem> securityItems = [
    SecurityItem(
      icon: Icons.lock_outline,
      iconColor: Colors.blue,
      title: "Change Password",
      subtitle: "Update your account password",
    ),
    SecurityItem(
      icon: Icons.delete_outline,
      iconColor: Colors.red,
      title: "Delete Account",
      subtitle: "Permanently remove your data",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text(
          "Security Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: securityItems.length,
          itemBuilder: (context, index) {
            final item = securityItems[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  //هي ويدجيت جاهزة في Flutter لعرض عنصر صف واحد (Row)
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: item.iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(item.icon, color: item.iconColor),
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    item.subtitle,
                    style: const TextStyle(fontSize: 13),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//=========================