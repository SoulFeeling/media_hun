import 'package:media_hub/index.dart';

class MediaListController extends GetxController {
  final RxList<Map<String, dynamic>> films = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasMore = true.obs;
  final RxBool isFilterExpanded = true.obs;

  int currentPage = 1;
  final int totalPages = 5;

  // 用于存储每个类别的选中状态，初始化为空
  final selectedFilters = <String, String?>{}.obs;

  void toggleFilter() {
    isFilterExpanded.value = !isFilterExpanded.value;
  }

  // 设置选中状态
  void setFilterSelection(String category, String? option) {
    if (selectedFilters[category] == option) {
      selectedFilters[category] = null; // 如果再次点击，则取消选中
    } else {
      selectedFilters[category] = option; // 设置新选项为选中
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadFilms();
  }

  void loadFilms() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // 模拟网络请求延迟

    // 模拟影片数据
    final newFilms = List.generate(
      9,
          (index) => {
        'title': '影片 ${index + (currentPage - 1) * 9}',
        'releaseDate': '2024-12-11',
        'rating': (7 + index % 3).toString(),
        'imageUrl': 'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2914052283.webp',
      },
    );

    films.addAll(newFilms);

    if (currentPage >= totalPages) {
      hasMore.value = false;
    } else {
      currentPage++;
    }

    isLoading.value = false;
  }
}
