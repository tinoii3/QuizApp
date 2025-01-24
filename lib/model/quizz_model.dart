class QuizzModel {
  String question;
  List<String> answers;

  QuizzModel(
    this.question,
    this.answers
    );

    List<String> getShuffledAnswers() {
      final ShuffledAnswers = List.of(answers);

      ShuffledAnswers.shuffle();

      return ShuffledAnswers;
    }
}
