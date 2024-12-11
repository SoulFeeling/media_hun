import '/index.dart';

class MainController extends GetxController {
  // 当前选中的导航索引
  var currentIndex = 0.obs;

  // 切换导航页面
  void changePage(int index) {
    currentIndex.value = index;
  }
}
