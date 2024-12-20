import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'widgets/s_collapse.dart';
import '../controllers/subject_detail_controller.dart';
import '../models/chapter_model.dart';
import '../models/knowledge_point_model.dart';

// Page
class SubjectDetailPage extends StatelessWidget {
  final SubjectDetailController controller = Get.put(SubjectDetailController());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;
    final String subjectName = arguments['subjectName'];
    controller.fetchChapters(arguments['subjectId']);

    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          // 构建静态的 ListView
          return _buildStaticListView(controller.chapters);
        }
      }),
    );
  }

  Widget _buildStaticListView(List<ChapterModel> chapters) {
    return ListView(
      padding: EdgeInsets.all(12.0),
      children: chapters.map((chapter) => _buildChapterSection(chapter)).toList(),
    );
  }

  Widget _buildChapterSection(ChapterModel chapter) {
    return ChapterSection(chapter: chapter);
  }
}

// StatefulWidget for the chapter section to manage rendering state
class ChapterSection extends StatefulWidget {
  final ChapterModel chapter;

  ChapterSection({required this.chapter});

  @override
  _ChapterSectionState createState() => _ChapterSectionState();
}

class _ChapterSectionState extends State<ChapterSection> with AutomaticKeepAliveClientMixin {
  late List<bool> _expandedStates;
  bool _isChapterExpanded = false;

  @override
  void initState() {
    super.initState();
    _expandedStates = List<bool>.filled(widget.chapter.knowledgePoints?.length ?? 0, false);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        key: PageStorageKey<int>(widget.chapter.chapterId), // 使用 PageStorageKey 来保持状态
        initiallyExpanded: _isChapterExpanded, // 使用状态变量
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isChapterExpanded = expanded;
          });
        },
        leading: Icon(Icons.book, color: Colors.blueAccent, size: 20),
        tilePadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        title: Text(
          widget.chapter.chapterName ?? '',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        children: (widget.chapter.knowledgePoints ?? []).asMap().entries.map<Widget>((entry) {
          int idx = entry.key + 1; // Start numbering from 1
          KnowledgePointModel knowledgePoint = entry.value;
          var name = '${idx}. ${knowledgePoint.pointName}';
          return SCollapse(
            title: name,
            content: knowledgePoint.detailedExplanation,
          );
        }).toList(),
      ),
    );
  }
}