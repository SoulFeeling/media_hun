import 'knowledge_point_model.dart';

class ChapterModel {
  int chapterId;
  String chapterName;
  List<KnowledgePointModel>? knowledgePoints;

  ChapterModel({required this.chapterId, required this.chapterName, this.knowledgePoints});

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      chapterId: json['chapterId'],
      chapterName: json['chapterName'],
      knowledgePoints: (json['knowledgePoints'] as List)
          .map((item) => KnowledgePointModel.fromJson(item))
          .toList(),
    );
  }
}
