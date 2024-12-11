import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../models/chapter_model.dart';
import '../services/api_service.dart';

class ChapterController extends GetxController {
  var isLoading = true.obs;
  var chapterDetails = ChapterModel(chapterId: -1 ,chapterName: "").obs;

  final Dio _dio = ApiService().dio;

  // 获取指定章节的知识点信息
  void loadChapterDetails(int chapterId) async {
    try {
      isLoading(true);
      final response = await _dio.get('/api/blog/subjects/$chapterId/chapters');
      if (response.statusCode == 200 && response.data['code'] == 0) {
        chapterDetails.value = ChapterModel.fromJson(response.data['data']);
      } else {
        Get.snackbar('Error', 'Failed to load chapter details');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}
