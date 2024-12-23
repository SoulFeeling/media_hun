import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:media_hub/app/pages/player/media_player_screen_controller.dart';

import 'widgets/screen_horizontal.dart';
import 'widgets/screen_vertical.dart';

class MediaPlayerScreen extends StatelessWidget {
  final MediaPlayerScreeController controller = Get.put(MediaPlayerScreeController());

  MediaPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // 控制横竖屏时，锁定屏幕方向
      if (controller.isFullScreen.value) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
      } else {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      }

      return Scaffold(
        backgroundColor: Colors.black,
        body: controller.isFullScreen.value ? _buildFullScreenPlayer() : _buildPortraitPlayer(),
      );
    });
  }

  /// 横屏播放器
  Widget _buildFullScreenPlayer() {
    return ScreenHorizontal();
  }

  /// 竖屏播放器
  Widget _buildPortraitPlayer() {
    return ScreenVertical();
  }
}
