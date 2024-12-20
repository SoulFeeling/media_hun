import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../views/videos/film/film_home_page.dart';

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
            children: const [
              FilmHomePage(),
              ResourceLibraryPage(),
              MyPage(),
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

class ResourceLibraryPage extends StatelessWidget {
  const ResourceLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('资源库页面'),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('我的页面'),
    );
  }
}
