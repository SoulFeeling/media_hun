import 'package:flutter/material.dart';
import 'package:media_hub/index.dart';

class MediaDetailPlayerButton extends StatelessWidget {
  const MediaDetailPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // 跳转到视频播放页面
          Get.toNamed(AppRoutes.MediaPlayerScreen);
        },
        icon: Icon(Icons.play_arrow),
        label: Text('播放'),
        style: ElevatedButton.styleFrom(
          // 最小宽度为屏幕宽度的80%，高度为50
          backgroundColor: Colors.black,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
          // minimumSize: Size(double.infinity * 0.8, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
