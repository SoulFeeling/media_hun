import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/chapter_model.dart';

class SubjectDetailController extends GetxController {
  var isLoading = true.obs;
  var chapters = <ChapterModel>[].obs;
  var errorMessage = ''.obs;

  // 获取指定科目的章节和知识点
  Future<void> fetchChapters(String subjectId) async {
    try {
      isLoading.value = true;
      chapters.value = await ApiService().getChaptersAndKnowledgePoints(subjectId);
    } catch (e) {
      errorMessage.value = 'Failed to load chapters: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
