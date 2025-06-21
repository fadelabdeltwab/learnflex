import 'package:dio/dio.dart';
import 'package:learn_fix/data/models/question_model.dart';

class QuestionService {
  final Dio dio;

  QuestionService({required this.dio});

  Future<QuestionModel> getQuiz() async {
    try {
      final response = await dio.get('http://192.168.1.6:5000/api/questions/');
      return QuestionModel.fromJson(response.data);
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'حدث خطأ ما';
      throw Exception(message);
    }
  }
}
