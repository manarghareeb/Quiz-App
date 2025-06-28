class Question {
  String questionText;
  List<Answer> answerList;

  Question(this.questionText, this.answerList);
}
class Answer {
  String answerText;
  bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}
List<Question> getQuestion() {

  List<Question> qlist = [];

  qlist.add(
    Question("What is the capital city of France?", [
      Answer("Berlin", false),
      Answer("Madrid", false),
      Answer("Paris", true),
      Answer("Rome", false),
    ]),
  );

  qlist.add(
    Question("Which planet is known as the Red Planet?", [
      Answer("Venus", false),
      Answer("Mars", true),
      Answer("Jupiter", false),
      Answer("Saturn", false),
    ]),
  );

  qlist.add(
    Question("What is the largest ocean on Earth?", [
      Answer("Atlantic Ocean", false),
      Answer("Indian Ocean", false),
      Answer("Pacific Ocean", true),
      Answer("Arctic Ocean", false),
    ]),
  );

  qlist.add(
    Question("Which language is used to develop Flutter apps?", [
      Answer("Kotlin", false),
      Answer("Swift", false),
      Answer("Dart", true),
      Answer("Java", false),
    ]),
  );

  qlist.add(
    Question("What year did World War II end?", [
      Answer("1942", false),
      Answer("1945", true),
      Answer("1939", false),
      Answer("1950", false),
    ]),
  );

  return qlist;
}