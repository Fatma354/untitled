import 'package:flutter/material.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  int _currentQuestionIndex = 0;
  String? selectedOption;

  bool showFinalCard = false;
  bool showResult = false; 
  String? finalSelectedOption;
  int score = 0; 

  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is the normal resting heart rate for adults?",
      "options": ["40-50 bpm", "60-100 bpm", "110-130 bpm", "10-30 bpm"],
      "answer": "60-100 bpm",
    },
    {
      "question": "Which vitamin is produced by the body when exposed to sunlight?",
      "options": ["Vitamin C", "Vitamin A", "Vitamin D", "Vitamin B12"],
      "answer": "Vitamin D",
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    if (showResult) return buildResultCard();
    if (showFinalCard) return buildFinalQuestion();

    final currentQuestion = questions[_currentQuestionIndex];
    final List<String> options = List<String>.from(currentQuestion['options']);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        Row(
          children: const [
            Icon(Icons.school_outlined, color: Color(0xFF4CAF50), size: 22),
            SizedBox(width: 8),
            Text(
              "Health Trivia",
              style: TextStyle(
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "QUESTION ${_currentQuestionIndex + 1}/${questions.length + 1}",
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          currentQuestion['question'],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),
        ...options.map((option) {
          bool isSelected = selectedOption == option;
          int index = options.indexOf(option);
          String letter = String.fromCharCode(65 + index);

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedOption = option;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF2ECC71) : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: isSelected ? const Color(0xFF2ECC71) : Colors.grey.shade200,
                      child: Text(
                        letter,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(option),
                    const Spacer(),
                    if (isSelected)
                      const Icon(Icons.check_circle, color: Color(0xFF2ECC71)),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: selectedOption == null
              ? null
              : () {
                  setState(() {
                  
                    if (selectedOption == currentQuestion['answer']) {
                      score++;
                    }

                    if (_currentQuestionIndex == questions.length - 1) {
                      showFinalCard = true;
                    } else {
                      _currentQuestionIndex++;
                      selectedOption = null;
                    }
                  });
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2ECC71),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: Text(
            _currentQuestionIndex == questions.length - 1 ? "Submit Answer" : "Next",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }


  Widget buildFinalQuestion() {
    List<String> options = ["1 Liter", "5 liters", "2-3 liters", "10 liters"];
    String correctAnswer = "2-3 liters";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        const Text(
          "How much water should an average adult drink daily?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...options.map((option) {
          bool isSelected = finalSelectedOption == option;
          int index = options.indexOf(option);
          String letter = String.fromCharCode(65 + index);

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                setState(() {
                  finalSelectedOption = option;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF2ECC71) : Colors.grey.shade300,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: isSelected ? const Color(0xFF2ECC71) : Colors.grey.shade200,
                      child: Text(
                        letter,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(option),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 25),
        ElevatedButton(
          onPressed: finalSelectedOption == null
              ? null
              : () {
                  setState(() {
                    if (finalSelectedOption == correctAnswer) {
                      score++;
                    }
                    showResult = true;
                  });
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2ECC71),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: const Text(
            "Finish Quiz",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }


  Widget buildResultCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.school_outlined, color: Color(0xFF34495E), size: 20),
              SizedBox(width: 8),
              Text(
                "HEALTH TRIVIA",
                style: TextStyle(
                  color: Color(0xFF34495E),
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 45,
            backgroundColor: const Color(0xFFE8F8F0),
            child: const Icon(
              Icons.emoji_events_outlined,
              color: Color(0xFF2ECC71),
              size: 50,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "You scored $score / ${questions.length + 1}",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Thanks for learning!",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
        
                showResult = false;
                showFinalCard = false;
                _currentQuestionIndex = 0;
                selectedOption = null;
                finalSelectedOption = null;
                score = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              minimumSize: const Size(double.infinity, 55),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text(
              "Restart Quiz",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}