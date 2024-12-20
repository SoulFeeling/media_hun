import 'package:flutter/material.dart';

class MediaDetailFileInfo extends StatelessWidget {
  const MediaDetailFileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // 模拟文件信息
    final fileInfo = {
      'fileName': '电影文件名.mp4',
      'filePath': '/path/to/file',
      'duration': '120分钟',
      'fileType': 'MP4',
      'fileSize': '2GB',
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 文件名称
          Text(
            fileInfo['fileName']!,
            style: const TextStyle(
              fontSize: 10.0,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 8.0),

          // 文件路径
          Text(
            fileInfo['filePath']!,
            style: const TextStyle(
              fontSize: 8.0,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 8.0),

          // 文件信息：时长、类型、文件大小
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '时长: ${fileInfo['duration']}',
                style: const TextStyle(
                  fontSize: 8.0,
                  color: Colors.black45,
                ),
              ),
              // 空格
              const SizedBox(width: 8.0),

              Text(
                '类型: ${fileInfo['fileType']}',
                style: const TextStyle(
                  fontSize: 8.0,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '大小: ${fileInfo['fileSize']}',
                style: const TextStyle(
                  fontSize: 8.0,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
