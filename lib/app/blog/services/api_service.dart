import 'package:dio/dio.dart';

import '../../../index.dart';
import '../controllers/api_domain_controller.dart';
import '../models/category_model.dart';
import '../models/chapter_model.dart';

class ApiService {

  final Dio dio;
  final ApiDomainController _apiDomainController = Get.put(ApiDomainController());

  ApiService()
      : dio = Dio(BaseOptions(
          baseUrl: Get.put(ApiDomainController()).currentDomain.value,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        )) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    // 监听域名变化并更新 baseUrl
    _apiDomainController.currentDomain.listen((newDomain) {
      dio.options.baseUrl = newDomain;
    });
  }

  // 更新 dio 的 baseUrl 当域名发生变化时
  void updateBaseUrl() {
    var url = Get.put(ApiDomainController()).currentDomain.value;
    print("切换域名：" + url);
    dio.options.baseUrl = url;
  }

  // 获取科目分类和科目列表
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await dio.get('/categories');
      if (response.statusCode == 200 && response.data['code'] == 0) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  // 获取指定科目的章节和知识点
  Future<List<ChapterModel>> getChaptersAndKnowledgePoints(String subjectId) async {
    try {
      final response = await dio.get('/subjects/$subjectId/chapters');
      if (response.statusCode == 200 && response.data['code'] == 0) {
        List<dynamic> chaptersData = response.data['data'];
        // 解析章节数据
        return chaptersData.map((chapterData) => ChapterModel.fromJson(chapterData)).toList();
      } else {
        throw Exception('Failed to load chapters');
      }
    } catch (e) {
      throw Exception('Failed to load chapters: $e');
    }
  }
}
