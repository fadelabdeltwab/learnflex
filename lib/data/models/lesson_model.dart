class LessonModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String model;

  LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.model,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      model: json['model'],
    );
  }
}
