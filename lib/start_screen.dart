import 'package:flutter/material.dart';
import 'package:myapp/question_summary.dart';
import 'package:myapp/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/quiz-logo.png',
                width: 300,
                color: Colors.white.withOpacity(0.6),
              ),
              const SizedBox(height: 30),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionsScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
                label: const Text(
                  'Start Quiz',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const QuestionsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
