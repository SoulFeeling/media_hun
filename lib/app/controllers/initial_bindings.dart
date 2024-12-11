import 'package:get/get.dart';

import 'index.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(ThemeController());
  }
}
