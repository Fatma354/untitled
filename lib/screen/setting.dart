import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart'; // SecurityItem

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text(
          "Security Settings",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: securityItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return _SecurityItemTile(item: securityItems[index]);
        },
      ),
    );
  }
}

class _SecurityItemTile extends StatelessWidget {
  final SecurityItem item;

  const _SecurityItemTile({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Implement tap action
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: item.iconColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.icon, color: item.iconColor),
            ),
            title: Text(
              item.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              item.subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}
