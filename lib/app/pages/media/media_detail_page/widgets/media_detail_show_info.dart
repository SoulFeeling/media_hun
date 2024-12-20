import 'package:flutter/material.dart';

class MediaDetailShowInfo extends StatelessWidget {
  const MediaDetailShowInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 450,
      width: double.infinity,
      child: Stack(
        children: [
          // 背景图片
          Image.network(
            'http://192.168.1.8:9001/image2.png', // 背景图 URL
            fit: BoxFit.cover,
            width: double.infinity,
            height: 450,
          ),
          // 图层内容
          Positioned(
            left: 16,
            bottom: 16,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 影视名称
                  Text(
                    '影视名称',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // 影视详情
                  Text(
                    '豆瓣分数: 8.5 | 上映时间: 2024-12-15 | 12集',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  // 影视类型
                  Text(
                    '类型: 动作 / 科幻 / 冒险',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
