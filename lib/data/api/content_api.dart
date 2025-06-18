import 'package:dio/dio.dart';

import '../models/content_model.dart';

class ContentService {
  final Dio dio;

  ContentService({required this.dio});

  Future<ContentModel> getContent() async {
    try {
      final response = await dio.get('http://localhost:5000/api/');
      return ContentModel.fromJson(response.data);
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'حدث خطأ ما';
      throw Exception(message);
    }
  }
}
