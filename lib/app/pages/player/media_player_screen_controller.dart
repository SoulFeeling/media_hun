import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MediaPlayerScreeController extends GetxController {
  RxBool isFullScreen = false.obs;

  // 切换屏幕横竖屏
  void toggleFullScreen() {
    if (isFullScreen.value) {
      // 退出全屏模式
      isFullScreen.value = false;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } else {
      // 进入全屏模式
      isFullScreen.value = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  @override
  void onClose() {
    // 离开页面时恢复竖屏模式
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.onClose();
  }
}
