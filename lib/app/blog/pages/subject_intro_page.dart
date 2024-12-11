// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/subject_detail_controller.dart';
// import '../models/subject_model.dart';
//
// class SubjectIntroPage extends StatelessWidget {
//   final SubjectDetailController controller = Get.put(SubjectDetailController());
//
//   @override
//   Widget build(BuildContext context) {
//     final int subjectId = Get.arguments;
//     controller.loadSubjectDetails(subjectId);
//
//     return Scaffold(
//       appBar: AppBar(title: Text('科目简介')),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           final SubjectModel subject = controller.subjectDetails.value;
//           if (subject.subjectId == null) {
//             return Center(child: Text('未找到科目'));
//           }
//
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(subject.subjectName ?? '', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 8),
//                     Text(subject.description ?? ''),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: subject.chapters?.length ?? 0,
//                   itemBuilder: (context, index) {
//                     final chapter = subject.chapters![index];
//                     return ListTile(
//                       title: Text(chapter.chapterName ?? ''),
//                       onTap: () {
//                         // 跳转到章节知识点列表页面
//                         Get.toNamed('/chapter_knowledge_points', arguments: chapter.chapterId);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//       }),
//     );
//   }
// }
