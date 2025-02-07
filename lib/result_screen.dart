import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/questions_screen.dart';
import 'package:myapp/question_summary.dart';
import 'package:myapp/start_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<String> selectedAnswers;

  const ResultScreen({
    required this.selectedAnswers,
    super.key,
  });

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      bool isCorrect = selectedAnswers[i] == questions[i].answers[0];

      summaryData.add({
        'question_id': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': isCorrect,
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final totalMark =
        summarydata.where((data) => data['is_correct'] as bool).length;
    final totalQuestion = questions.length;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
          child: SizedBox(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You answered $totalMark out of $totalQuestion questions correctly!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 201, 153, 251),
                    ),
                  ),
                  QuestionSummary(summaryData: getSummaryData()),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartScreen()));
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
