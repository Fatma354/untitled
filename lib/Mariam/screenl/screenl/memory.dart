import 'package:flutter/material.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
 
  bool isGameFinished = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
   
      child: isGameFinished ? buildResultView() : buildGameView(),
    );
  }

  
  Widget buildGameView() {
    return Column(
      key: const ValueKey(1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Row(
          children: [
            Icon(Icons.psychology_outlined, color: Colors.blue, size: 22),
            SizedBox(width: 8),
            Text("Memory Match", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18)),
            Spacer(),
            Text("Moves: 16", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 9, 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("?", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
        
        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton(
            onPressed: () => setState(() => isGameFinished = true),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text("Finish Game", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildResultView() {
    return Container(
      key: const ValueKey(2),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.shade50),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Active Game", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
              Text("Moves: 18", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: [
              _buildIconCard(Icons.favorite, Colors.red),
              _buildIconCard(Icons.local_hospital, Colors.orange),
              _buildIconCard(Icons.fitness_center, Colors.blueGrey),
              _buildIconCard(Icons.favorite_border, Colors.redAccent),
              _buildIconCard(Icons.medication, Colors.orangeAccent),
              _buildIconCard(Icons.monitor_weight, Colors.blueGrey),
              _buildIconCard(Icons.air, Colors.lightBlue),
              _buildIconCard(Icons.medical_services, Colors.greenAccent),
              _buildIconCard(Icons.wind_power, Colors.lightBlueAccent),
            ],
          ),
          const SizedBox(height: 20),
          const Text("✅ Great job! Brain exercise complete.", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          
          ElevatedButton(
            onPressed: () => setState(() => isGameFinished = false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: const Text("Play Again", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  
  Widget _buildIconCard(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color, size: 30),
    );
  }
}