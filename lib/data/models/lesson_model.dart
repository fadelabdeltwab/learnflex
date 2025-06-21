import 'package:learn_fix/data/models/question_model.dart';

class LessonModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String model;
  final List<QuestionModel> questions;

<<<<<<< HEAD
=======

>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.model,
<<<<<<< HEAD
    required this.questions,
=======
        required this.questions,

>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    // تحويل قايمة الأسئلة من الـ JSON لـ List<QuestionModel>
    List<dynamic> questionsJson = json['questions'] as List<dynamic>;
<<<<<<< HEAD
    List<QuestionModel> questionsList =
        questionsJson.map((q) => QuestionModel.fromJson(q)).toList();
=======
    List<QuestionModel> questionsList = questionsJson.map((q) => QuestionModel.fromJson(q)).toList();
>>>>>>> b8f7deb89b6439143d3456d36ce7038626e6821c

    return LessonModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      model: json['model'] as String,
      questions: questionsList,
    );
  }
}
