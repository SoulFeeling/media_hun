import '/app/blog/models/subject_model.dart';

class CategoryModel {
  int categoryId;
  String categoryName;
  List<SubjectModel>? subjects;

  CategoryModel({required this.categoryId, required this.categoryName, this.subjects});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      subjects: (json['subjects'] as List)
          .map((item) => SubjectModel.fromJson(item))
          .toList(),
    );
  }
}
