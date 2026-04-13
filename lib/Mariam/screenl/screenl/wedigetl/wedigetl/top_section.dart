import 'package:flutter/material.dart';
import 'package:sugar_wise/models/data.dart';

import 'feature_card.dart';

class TopSection extends StatefulWidget {
  final Function(int) onSelected;

  const TopSection({super.key, required this.onSelected});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Health & Wellness Hub",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "Sharpen your mind and stay healthy",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 15),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: features.length,
            itemBuilder: (context, index) {
              return FeatureCard(
                model: features[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  widget.onSelected(index); // 👈 بيرجع القيمة للشاشة
                },
              );
            },
          ),

        ],
      ),
    );
  }
}