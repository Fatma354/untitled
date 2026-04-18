/*import 'package:flutter/material.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int _currentQuestionIndex = 0;
  String? selectedOption;
  bool showResult = false;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the normal resting heart rate for adults?",
      "options": ["40-50 bpm", "60-100 bpm", "110-130 bpm", "10-30 bpm"],
      "answer": "60-100 bpm",
    },
    {
      "question":
          "Which vitamin is produced by the body when exposed to sunlight?",
      "options": ["Vitamin C", "Vitamin A", "Vitamin D", "Vitamin B12"],
      "answer": "Vitamin D",
    },
    {
      "question": "How much water should an average adult drink daily?",
      "options": ["1 Liter", "5 Liters", "2-3 Liters", "10 Liters"],
      "answer": "2-3 Liters",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF1F4F8,
      ), // لون الخلفية الرمادي كما في الصور
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان الرئيسي العلوي
              const Text(
                "Health & Wellness Hub",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sharpen your mind, learn about health, or take a moment to relax.",
                style: TextStyle(color: Colors.blueGrey, fontSize: 14),
              ),
              const SizedBox(height: 25),

              // الخيارات الثلاثة العلوية (Memory, Trivia, Relaxation)
              _buildTopOption(
                Icons.psychology,
                "Memory Match",
                "Boost cognitive skills",
                Colors.blue.shade50,
                Colors.blue,
              ),
              _buildTopOption(
                Icons.help_outline,
                "Health Trivia",
                "Test your knowledge",
                const Color(0xFF2ECC71),
                Colors.white,
                isSelected: true,
              ),
              _buildTopOption(
                Icons.air,
                "Relaxation",
                "Reduce anxiety",
                Colors.purple.shade50,
                Colors.purple,
              ),

              const SizedBox(height: 30),

              // الكارد الأبيض المقفول الذي يحتوي على السؤال (كما في الصور 2 و 3 و 4)
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: showResult ? _buildResultCard() : _buildQuestionCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ويدجت الخيارات العلوية
  Widget _buildTopOption(
    IconData icon,
    String title,
    String subtitle,
    Color bg,
    Color iconColor, {
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected ? bg : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white.withOpacity(0.2) : bg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : iconColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 15,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? Colors.white.withOpacity(0.9)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // الكارد المقفول للسؤال
  Widget _buildQuestionCard() {
    final currentQuestion = questions[_currentQuestionIndex];

    return Container(
      key: ValueKey(_currentQuestionIndex),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white, // الكارد مقفول بكونتينر أبيض
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header السؤال
          Row(
            children: [
              const Icon(
                Icons.school_outlined,
                color: Color(0xFF2ECC71),
                size: 26,
              ),
              const SizedBox(width: 8),
              const Text(
                "Health Trivia",
                style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          // نص QUESTION 1/3 الملون
          Text(
            "QUESTION ${_currentQuestionIndex + 1}/${questions.length}",
            style: const TextStyle(
              color: Color(0xFFE67E22), // اللون البرتقالي الموجود بالصور
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),

          // نص السؤال
          Text(
            currentQuestion['question'],
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 25),

          // خيارات الإجابة
          ...List.generate(currentQuestion['options'].length, (index) {
            String option = currentQuestion['options'][index];
            bool isSelected = selectedOption == option;
            return _buildOptionTile(
              String.fromCharCode(65 + index),
              option,
              isSelected,
            );
          }),

          const SizedBox(height: 30),

          // الشريط السفلي (النقاط والزر)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // النقاط (Progress Dots)
              Row(
                children: List.generate(questions.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: index == _currentQuestionIndex ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index <= _currentQuestionIndex
                          ? const Color(0xFF2ECC71)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              // زر Next
              ElevatedButton(
                onPressed: selectedOption == null ? null : _handleNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71),
                  disabledBackgroundColor: Colors.grey.shade300,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  _currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next ›",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ويدجت خيار الإجابة (A, B, C, D)
  Widget _buildOptionTile(String letter, String text, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedOption = text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF2ECC71).withOpacity(0.08)
              : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? const Color(0xFF2ECC71) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: isSelected
                  ? const Color(0xFF2ECC71)
                  : Colors.white,
              child: Text(
                letter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? const Color(0xFF2ECC71) : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF2ECC71),
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  void _handleNext() {
    if (selectedOption == questions[_currentQuestionIndex]['answer']) score++;
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        selectedOption = null;
      });
    } else {
      setState(() => showResult = true);
    }
  }

  // كارد النتيجة
  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.emoji_events_outlined,
            color: Colors.orange,
            size: 80,
          ),
          const SizedBox(height: 20),
          const Text(
            "You scored $score out of ${questions.length}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Thsnks for learning",
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => setState(() {
              _currentQuestionIndex = 0;
              score = 0;
              selectedOption = null;
              showResult = false;
            }),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              "Restart Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int _currentQuestionIndex = 0;
  String? selectedOption;
  bool showResult = false;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the normal resting heart rate for adults?",
      "options": ["40-50 bpm", "60-100 bpm", "110-130 bpm", "10-30 bpm"],
      "answer": "60-100 bpm",
    },
    {
      "question":
          "Which vitamin is produced by the body when exposed to sunlight?",
      "options": ["Vitamin C", "Vitamin A", "Vitamin D", "Vitamin B12"],
      "answer": "Vitamin D",
    },
    {
      "question": "How much water should an average adult drink daily?",
      "options": ["1 Liter", "5 Liters", "2-3 Liters", "10 Liters"],
      "answer": "2-3 Liters",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Health & Wellness Hub",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sharpen your mind, learn about health, or take a moment to relax.",
                style: TextStyle(color: Colors.blueGrey, fontSize: 14),
              ),
              const SizedBox(height: 25),

              _buildTopOption(
                Icons.psychology,
                "Memory Match",
                "Boost cognitive skills",
                Colors.blue.shade50,
                Colors.blue,
              ),
              _buildTopOption(
                Icons.help_outline,
                "Health Trivia",
                "Test your knowledge",
                const Color(0xFF2ECC71),
                Colors.white,
                isSelected: true,
              ),
              _buildTopOption(
                Icons.air,
                "Relaxation",
                "Reduce anxiety",
                Colors.purple.shade50,
                Colors.purple,
              ),

              const SizedBox(height: 30),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: showResult ? _buildResultCard() : _buildQuestionCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopOption(
    IconData icon,
    String title,
    String subtitle,
    Color bg,
    Color iconColor, {
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isSelected ? bg : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white.withOpacity(0.2) : bg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : iconColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 15,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? Colors.white.withOpacity(0.9)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard() {
    final currentQuestion = questions[_currentQuestionIndex];

    return Container(
      key: ValueKey(_currentQuestionIndex),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.school_outlined, color: Color(0xFF2ECC71), size: 26),
              SizedBox(width: 8),
              Text(
                "Health Trivia",
                style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),

          Text(
            "QUESTION ${_currentQuestionIndex + 1}/${questions.length}",
            style: const TextStyle(
              color: Color(0xFFE67E22),
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            currentQuestion['question'],
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3436),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 25),

          ...List.generate(currentQuestion['options'].length, (index) {
            String option = currentQuestion['options'][index];
            bool isSelected = selectedOption == option;
            return _buildOptionTile(
              String.fromCharCode(65 + index),
              option,
              isSelected,
            );
          }),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(questions.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: index == _currentQuestionIndex ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index <= _currentQuestionIndex
                          ? const Color(0xFF2ECC71)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              ElevatedButton(
                onPressed: selectedOption == null ? null : _handleNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71),
                  disabledBackgroundColor: Colors.grey.shade300,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  _currentQuestionIndex == questions.length - 1
                      ? "Finish"
                      : "Next ›",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(String letter, String text, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedOption = text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF2ECC71).withOpacity(0.08)
              : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? const Color(0xFF2ECC71) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: isSelected
                  ? const Color(0xFF2ECC71)
                  : Colors.white,
              child: Text(
                letter,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? const Color(0xFF2ECC71) : Colors.black87,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFF2ECC71),
                size: 22,
              ),
          ],
        ),
      ),
    );
  }

  void _handleNext() {
    if (selectedOption == questions[_currentQuestionIndex]['answer']) score++;
    if (_currentQuestionIndex < questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        selectedOption = null;
      });
    } else {
      setState(() => showResult = true);
    }
  }

  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // الكأس باللون الأخضر المطلوب
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF2ECC71).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: Color(0xFF2ECC71),
              size: 80,
            ),
          ),
          const SizedBox(height: 20),
          // تم إزالة const من هنا لحل المشكلة
          Text(
            "You scored $score out of ${questions.length}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A237E),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Thanks for learning!",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => setState(() {
              _currentQuestionIndex = 0;
              score = 0;
              selectedOption = null;
              showResult = false;
            }),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              minimumSize: const Size(double.infinity, 55),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              "Restart Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
