import 'package:flutter/material.dart';
import '../models/knowledge_point_model.dart';

class KnowledgePointDetail extends StatelessWidget {
  final KnowledgePointModel knowledgePoint;

  KnowledgePointDetail({required this.knowledgePoint});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(knowledgePoint.pointName ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(knowledgePoint.detailedExplanation ?? ''),
          ],
        ),
      ),
    );
  }
}
