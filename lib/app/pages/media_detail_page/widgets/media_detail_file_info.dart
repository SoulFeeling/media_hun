import 'package:flutter/material.dart';

import '../../../../index.dart';
import '../media_detail_controller.dart';

class MediaDetailFileInfo extends StatelessWidget {
  const MediaDetailFileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        '文件信息: 格式 - MP4, 分辨率 - 1080p, 文件大小 - 2GB',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
