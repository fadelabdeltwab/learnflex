import 'package:learn_fix/data/models/question_model.dart';
class Lesson {
  final int id;
  final String title;
  final String description;
  final String image;
  final String model;
  final List<QuestionModel> questions;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.model,
    required this.questions,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    // تحويل قايمة الأسئلة من الـ JSON لـ List<QuestionModel>
    List<dynamic> questionsJson = json['questions'] as List<dynamic>;
    List<QuestionModel> questionsList = questionsJson.map((q) => QuestionModel.fromJson(q)).toList();

    return Lesson(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      model: json['model'] as String,
      questions: questionsList,
    );
  }
}

class UnitModel {
  final String unit;
  final String title;
  final List<Lesson> lessons;

  UnitModel({required this.unit, required this.title, required this.lessons});

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      unit: json['unit'],
      title: json['title'],
      lessons:
          (json['lessons'] as List).map((e) => Lesson.fromJson(e)).toList(),
    );
  }
}

class Subject {
  final List<UnitModel> units;

  Subject({required this.units});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      units: (json['units'] as List).map((e) => UnitModel.fromJson(e)).toList(),
    );
  }
}

class Term {
  final Map<String, Subject> subjects;

  Term({required this.subjects});

  factory Term.fromJson(Map<String, dynamic> json) {
    final subjects = <String, Subject>{};
    json.forEach((key, value) {
      subjects[key] = Subject.fromJson(value);
    });
    return Term(subjects: subjects);
  }
}

class Grade {
  final Map<String, Term> terms;

  Grade({required this.terms});

  factory Grade.fromJson(Map<String, dynamic> json) {
    final terms = <String, Term>{};
    json.forEach((key, value) {
      terms[key] = Term.fromJson(value);
    });
    return Grade(terms: terms);
  }
}

class ContentModel {
  final Map<String, Grade> grades;

  ContentModel({required this.grades});

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    final grades = <String, Grade>{};
    json.forEach((key, value) {
      grades[key] = Grade.fromJson(value);
    });
    return ContentModel(grades: grades);
  }
}
