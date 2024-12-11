import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chapter_controller.dart';
import '../models/chapter_model.dart';

class ChapterKnowledgePointsPage extends StatelessWidget {
  final ChapterController controller = Get.put(ChapterController());

  @override
  Widget build(BuildContext context) {
    final int chapterId = Get.arguments;
    controller.loadChapterDetails(chapterId);

    return Scaffold(
      appBar: AppBar(title: Text('知识点列表')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final ChapterModel chapter = controller.chapterDetails.value;
          if (chapter.chapterId == null) {
            return Center(child: Text('未找到章节'));
          }

          return ListView.builder(
            itemCount: chapter.knowledgePoints?.length ?? 0,
            itemBuilder: (context, index) {
              final knowledgePoint = chapter.knowledgePoints![index];
              return ExpansionTile(
                title: Text(knowledgePoint.pointName ?? ''),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(knowledgePoint.detailedExplanation ?? ''),
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
