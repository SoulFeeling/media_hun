import 'chapter_model.dart';

class SubjectModel {
  int? subjectId;
  String? subjectName;
  String? description;
  String? icon;
  List<ChapterModel>? chapters; // 添加 chapters 属性

  SubjectModel({
    this.subjectId,
    this.subjectName,
    this.description,
    this.icon,
    this.chapters,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectId: json['subjectId'],
      subjectName: json['subjectName'],
      description: json['description'],
      icon: json['icon'],
      chapters: json['chapters'] != null
          ? (json['chapters'] as List).map((e) => ChapterModel.fromJson(e)).toList()
          : null,
    );
  }
}
