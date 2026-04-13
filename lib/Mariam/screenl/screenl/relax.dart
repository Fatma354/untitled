import 'package:flutter/material.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  int relaxStep = 0; 

  @override
  Widget build(BuildContext context) {
    // استخدمنا SizedBox.expand أو width: double.infinity لضمان ملىء العرض
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: relaxStep == 0 ? buildReadyUI() : buildHoldUI(),
    );
  }

  Widget buildReadyUI() {
    return Container(
      key: const ValueKey(0),
      width: double.infinity, // 👈 ده اللي هيخلي الكارت يملى العرض زي الصورة اللي على الشمال
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF8E54FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // بياخد مساحة المحتوى فقط في الطول
        children: [
          const Text("Stress Relief", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Deep Breathing Exercise", style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 40),
          Container(
            height: 140, width: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              border: Border.all(color: Colors.white.withOpacity(0.3), width: 6)
            ),
            child: const Center(
              child: Text("Ready", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => setState(() => relaxStep = 1),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, 
              foregroundColor: const Color(0xFF8E54FF),
              minimumSize: const Size(double.infinity, 55), // 👈 زرار عريض زي الصورة
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text("Start Breathing", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget buildHoldUI() {
    return Container(
      key: const ValueKey(1),
      width: double.infinity, // 👈 لضمان نفس عرض كارت الـ Ready
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF8E54FF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Stress Relief", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius: 90, backgroundColor: Colors.white.withOpacity(0.05)),
              CircleAvatar(radius: 70, backgroundColor: Colors.white.withOpacity(0.1)),
              CircleAvatar(
                radius: 50, 
                backgroundColor: Colors.white.withOpacity(0.2),
                child: const Text("Hold", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () => setState(() => relaxStep = 0),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, 
              foregroundColor: const Color(0xFF8E54FF),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: const StadiumBorder(),
            ),
            child: const Text("Stop", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}