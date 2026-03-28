import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final String title;

  const NextPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Center(child: Text("Welcome to $title")),
    );
  }
}
