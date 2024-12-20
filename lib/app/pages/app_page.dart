import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import 'media/media_files/media_files_page.dart';
import 'media/media_home/media_home_page.dart';
import 'media/media_settings/media_settings_page.dart';

class AppPageController extends GetxController {
  final RxInt selectedIndex = 0.obs;
}

class AppPage extends StatelessWidget {
  AppPage({super.key});

  final AppPageController controller = Get.put(AppPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: LazyLoadIndexedStack(
            index: controller.selectedIndex.value,
            children: [
              MediaHomePage(),
              MediaFilesPage(),
              MediaSettingsPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: '媒体',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                label: '资源库',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '我的',
              ),
            ],
          ),
        ));
  }
}
