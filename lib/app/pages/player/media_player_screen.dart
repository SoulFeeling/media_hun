import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_hub/app/pages/player/media_player_screen_controller.dart';

import 'widgets/screen_horizontal.dart';

class MediaPlayerScreen extends StatelessWidget {
  final MediaPlayerScreeController controller = Get.put(MediaPlayerScreeController());

  MediaPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.black,
        body: controller.isFullScreen.value ? _buildFullScreenPlayer() : _buildPortraitPlayer(),
      );
    });
  }

  /// 横屏播放器
  Widget _buildFullScreenPlayer() {
    return Stack(
      children: [
        Center(
          child: Image.network(
            'http://192.168.1.8:9001/image.png', // 视频区域使用替代图像
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          // bottom: 20,
          // right: 20,
          child: ScreenHorizontal(),
          // child: IconButton(
          //   onPressed: controller.toggleFullScreen,
          //   icon: Icon(Icons.fullscreen_exit, color: Colors.white, size: 32),
          // ),
        ),
      ],
    );
  }

  /// 竖屏播放器
  Widget _buildPortraitPlayer() {
    return Column(
      children: [
        // 视频区域 (占位图像)
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.black,
            child: Image.network(
              'http://192.168.1.10:9001/image2.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        // 功能按钮区域
        _buildControlPanel(),
      ],
    );
  }

  /// 播放器功能按钮区域
  Widget _buildControlPanel() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 其他按钮 (暂时空置)
          _buildButton(icon: Icons.play_arrow, onPressed: () {}),
          SizedBox(width: 16),
          _buildButton(icon: Icons.pause, onPressed: () {}),
          SizedBox(width: 16),
          _buildButton(icon: Icons.fullscreen, onPressed: controller.toggleFullScreen),
        ],
      ),
    );
  }

  /// 通用按钮组件
  Widget _buildButton({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 32),
    );
  }
}
