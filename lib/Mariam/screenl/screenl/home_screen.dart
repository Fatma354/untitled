import 'package:flutter/material.dart';
import 'package:sugar_wise/screenl/memory.dart';
import 'package:sugar_wise/screenl/relax.dart';
import 'package:sugar_wise/screenl/trivial.dart';
import 'package:sugar_wise/wedigetl/top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  Widget getActiveScreen() {
    switch (currentIndex) {
      case 0: return const MemoryScreen();
      case 1: return const TriviaScreen();
      case 2: return const RelaxScreen();
      default: return const MemoryScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Column( 
          children: [
            
            TopSection(
              onSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),

            const SizedBox(height: 10),

          
            Expanded( 
              child: SingleChildScrollView( 
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      key: ValueKey(currentIndex),
                      child: getActiveScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}