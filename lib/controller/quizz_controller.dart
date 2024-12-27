import 'package:myapp/data/quizz.dart';
import 'package:myapp/model/quizz_model.dart';

class QuizzController {
  int _currentQuestionIndex = 0;

  QuizzModel getCurrentQuestion() {
    return questions[_currentQuestionIndex];
  }

  void nextQuestion() {
    if (_currentQuestionIndex < questions.length - 1) {
      _currentQuestionIndex++;
    }
  }

  bool isLastQuestion() {
    return _currentQuestionIndex == questions.length - 1;
  }
}
