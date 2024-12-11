import 'package:get/get.dart';
import '../models/category_model.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // 获取分类数据
  void fetchCategories() async {
    isLoading.value = true;
    try {
      var fetchedCategories = await _apiService.fetchCategories();
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // 底部导航栏切换
  void updateIndex(int index) {
    // 这里可以添加导航逻辑，比如切换页面
  }
}
