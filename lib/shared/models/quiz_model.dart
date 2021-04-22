import 'dart:convert';

enum Level {
  Easy,
  Medium,
  Hard,
  Pro
}

extension LevelStringExt on String {
  Level get levelParse => {"easy": Level.Easy, "medium": Level.Medium, "hard": Level.Hard, "pro": Level.Pro}[this]!;
}

extension LevelExt on Level {
  String get parsed => {
    Level.Easy: "easy",
    Level.Medium: "medium",
    Level.Hard: "hard",
    Level.Pro: "pro",
    }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({this.questionsAnswered = 0, required this.title, required this.questions, required this.image, required this.level});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.parsed,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
  
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: map['image'],
      level: (map['level'].toString().levelParse),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({required this.title, required this.answers}):
    assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
  
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));
}

class AnswerModel {
  final String title;
  final bool isRight;

  AnswerModel({required this.title, this.isRight = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
  
    return AnswerModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) => AnswerModel.fromMap(json.decode(source));
}
