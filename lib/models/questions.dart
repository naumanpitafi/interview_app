class Question {
  int? id, answer;
  String? question;
  List<dynamic>? options;

  Question({this.id, this.question, this.answer, this.options});
  factory Question.fromMap(map) {
    return Question(
      id: map['id'],
      question: map['question'],
      answer: map['answer_index'],
      options: map['options'],
    );
  }
}
