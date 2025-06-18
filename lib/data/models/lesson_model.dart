import 'package:learn_fix/data/models/question_model.dart';

class LessonModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String model;
  final List<QuestionModel> questions;


  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.model,
        required this.questions,

  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    // تحويل قايمة الأسئلة من الـ JSON لـ List<QuestionModel>
    List<dynamic> questionsJson = json['questions'] as List<dynamic>;
    List<QuestionModel> questionsList = questionsJson.map((q) => QuestionModel.fromJson(q)).toList();

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
