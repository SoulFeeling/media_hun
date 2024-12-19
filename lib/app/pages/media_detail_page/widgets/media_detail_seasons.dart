import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaDetailController extends GetxController {
  // 当前选中的季数 (默认为第1季)
  var selectedSeason = 1.obs;

  // 模拟每季的集数数据
  final episodes = [
    // 第1季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称', 'duration': '20:45', 'progress': 0.5},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称', 'duration': '15:30', 'progress': 0.8},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第三集名称', 'duration': '25:00', 'progress': 0.3},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第四集名称', 'duration': '12:15', 'progress': 0.0},
    ],
    // 第2季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称', 'duration': '22:15', 'progress': 0.4},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称', 'duration': '18:00', 'progress': 0.6},
    ],
    // 第3季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称', 'duration': '20:00', 'progress': 0.0},
    ],
  ];
}

class MediaDetailSeasons extends StatelessWidget {
  MediaDetailSeasons({super.key});

  final MediaDetailController controller = Get.put(MediaDetailController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 季数选择模块
          Obx(() => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(controller.episodes.length, (index) {
                int seasonNumber = index + 1;
                return GestureDetector(
                  onTap: () {
                    controller.selectedSeason.value = seasonNumber; // 更新选中季数
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Text(
                          '第$seasonNumber季',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: controller.selectedSeason.value == seasonNumber ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (controller.selectedSeason.value == seasonNumber)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 2,
                            width: 40,
                            color: Colors.blue,
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )),
          const SizedBox(height: 10),
          // 当前季的集数模块 (单行滑动的图片列表)
          Obx(() => Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.episodes[controller.selectedSeason.value - 1].length,
              itemBuilder: (context, index) {
                final episode = controller.episodes[controller.selectedSeason.value - 1][index];
                final String image = episode['image'] as String;
                final String duration = episode['duration'] as String;
                final double progress = (episode['progress'] as num).toDouble();

                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 集图片 (16:9)
                      Stack(
                        children: [
                          Container(
                            width: 160,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
                                child: Container(
                                  height: 4,
                                  width: 160,
                                  color: Colors.grey[300],
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 4,
                                      width: 160 * progress,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // 播放时长
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                duration,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // 播放按钮
                          Positioned.fill(
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  // 播放按钮点击事件处理
                                },
                                child: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // 集名称
                      Text(
                        '${index + 1}.${episode['name']}',
                        style: const TextStyle(fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
