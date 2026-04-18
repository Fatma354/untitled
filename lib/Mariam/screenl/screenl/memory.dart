import 'package:flutter/material.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _HealthWellnessHubState();
}

class _HealthWellnessHubState extends State<MemoryScreen> {
  // الحالة الحالية للمحتوى (0: Memory, 1: Trivia, 2: Relaxation)
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 1. العنوان العلوي في المنتصف (Centered Title)
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Health & Wellness Hub",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A237E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Sharpen your mind, learn about health, or take a moment to relax.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 2. قائمة البطاقات (Options)
              _buildOptionCard(
                0,
                "Memory Match",
                "Boost cognitive skills",
                Icons.psychology,
                Colors.blue,
              ),
              _buildOptionCard(
                1,
                "Health Trivia",
                "Test your knowledge",
                Icons.help_outline,
                Colors.green,
              ),
              _buildOptionCard(
                2,
                "Relaxation",
                "Reduce anxiety",
                Icons.air,
                Colors.purple,
              ),

              const SizedBox(height: 20),

              // 3. المحتوى المتغير (The Result/Action Card)
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: _buildActiveContent(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ميثود بناء البطاقات العلوية
  Widget _buildOptionCard(
    int index,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    bool isActive = activeIndex == index;
    return GestureDetector(
      onTap: () => setState(() => activeIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isActive ? color : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: isActive
                  ? Colors.white24
                  : color.withOpacity(0.1),
              child: Icon(icon, color: isActive ? Colors.white : color),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isActive ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: isActive ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // تبديل المحتوى بناءً على البطاقة المختارة
  Widget _buildActiveContent() {
    switch (activeIndex) {
      case 0:
        return const Center(child: Text("Memory Match Content"));
      case 1:
        return const TriviaScoreView(); // صفحة النتيجة
      case 2:
        return const RelaxationView(); // صفحة الاسترخاء
      default:
        return Container();
    }
  }
}

// --- محتوى صفحة النتيجة (Trivia Score) ---
class TriviaScoreView extends StatelessWidget {
  const TriviaScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.school, color: Colors.green, size: 20),
              SizedBox(width: 8),
              Text(
                "HEALTH TRIVIA",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          // الكأس الأخضر
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.green,
              size: 70,
            ),
          ),
          const SizedBox(height: 25),
          // نص النتيجة كما طلبتِ
          const Text(
            "You scored 1 / 3",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Thanks for learning!",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const Spacer(),
          // زر إعادة الاختبار
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Restart Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- محتوى صفحة الاسترخاء (Relaxation) ---
class RelaxationView extends StatelessWidget {
  const RelaxationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9575CD), Color(0xFF7E57C2)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Stress Relief",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Deep Breathing Exercise",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 50),
          // دائرة "Hold" أو "Ready"
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    "Hold",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          // زر التوقف
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF7E57C2),
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              shape: const StadiumBorder(),
            ),
            child: const Text(
              "Stop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Session length: 5 minutes",
            style: TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
