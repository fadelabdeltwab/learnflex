import 'package:flutter/foundation.dart';

class QuestionModel {
  final String question;
  final List<OptionModel> options;
  final String answer;

  QuestionModel({
    required this.question,
    required this.options,
    required this.answer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    // تحويل الخيارات من قايمة بسيطة لـ List<OptionModel>
    List<dynamic> choices = json['choices'] as List<dynamic>;
    List<OptionModel> optionsList = choices.map((e) => OptionModel(option: e as String)).toList();

    return QuestionModel(
      question: json['question'] as String,
      answer: json['answer'] as String,
      options: optionsList,
    );
  }
}

class OptionModel {
  final String option;

  OptionModel({required this.option});
}