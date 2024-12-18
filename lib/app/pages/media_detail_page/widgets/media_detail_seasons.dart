import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MediaDetailController extends GetxController {
  // 当前选中的季数 (默认为第1季)
  var selectedSeason = 1.obs;

  // 模拟每季的集数数据
  final episodes = [
    // 第1季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第三集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第四集名称'},
    ],
    // 第2季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称'},
    ],
    // 第3季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称'},
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
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 集图片 (16:9)
                      Container(
                        width: 160,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(episode['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
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
