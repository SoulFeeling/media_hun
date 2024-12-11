import 'package:flutter/material.dart';
import '../models/chapter_model.dart';

class ChapterItem extends StatelessWidget {
  final ChapterModel chapter;

  ChapterItem({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chapter.chapterName ?? ''),
      onTap: () {
        // Navigate to knowledge point details or expand
      },
    );
  }
}
