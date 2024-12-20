import '/index.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();

    return Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home), label: '首页'.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.folder), label: '文件夹'.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.settings), label: '设置'.tr),
          ],
        ));
  }
}
