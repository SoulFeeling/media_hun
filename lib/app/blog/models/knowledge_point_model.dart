class KnowledgePointModel {
  int? knowledgePointId;
  String pointName;
  String detailedExplanation;

  KnowledgePointModel({this.knowledgePointId, required this.pointName, required this.detailedExplanation});

  factory KnowledgePointModel.fromJson(Map<String, dynamic> json) {
    return KnowledgePointModel(
      knowledgePointId: json['knowledgePointId'],
      pointName: json['pointName'],
      detailedExplanation: json['detailedExplanation'],
    );
  }
}
