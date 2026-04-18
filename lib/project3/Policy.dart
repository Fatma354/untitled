import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';

class Policy extends StatelessWidget {
  final PolicySectionModel section;

  const Policy({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // القسم العلوي: الأيقونة في الأعلى وتحتها العنوان
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(section.icon, color: section.iconColor, size: 28),
              const SizedBox(height: 8),
              Text(
                section.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // القائمة الداخلية (بدون if)
          ...section.items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الأيقونة بجانب النص مباشرة
                  Icon(item.icon, size: 16, color: item.iconColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.text,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
