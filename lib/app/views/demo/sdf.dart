import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeasonsController extends GetxController {
  // 当前选中的季数 (默认为第1季)
  var selectedSeason = 1.obs;

  // 模拟每季的集数数据
  final episodes = [
    // 第1季
    [
      {'image': 'https://example.com/episode1.jpg', 'name': '第一集名称'},
      {'image': 'https://example.com/episode2.jpg', 'name': '第二集名称'},
    ],
    // 第2季
    [
      {'image': 'https://example.com/episode3.jpg', 'name': '第一集名称'},
      {'image': 'https://example.com/episode4.jpg', 'name': '第二集名称'},
    ],
    // 第3季
    [
      {'image': 'https://example.com/episode5.jpg', 'name': '第一集名称'},
      {'image': 'https://example.com/episode6.jpg', 'name': '第二集名称'},
    ],
  ];
}

class MovieSeasonsWidget extends StatelessWidget {
  final SeasonsController controller = Get.put(SeasonsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
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
                            fontWeight: controller.selectedSeason.value == seasonNumber
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (controller.selectedSeason.value == seasonNumber)
                          Container(
                            margin: EdgeInsets.only(top: 4),
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
          SizedBox(height: 10),
          // 当前季的集数模块
          Obx(() => Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
              ),
              itemCount: controller.episodes[controller.selectedSeason.value - 1].length,
              itemBuilder: (context, index) {
                final episode =
                controller.episodes[controller.selectedSeason.value - 1][index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 集图片
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(episode['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    // 集名称
                    Text(
                      '${index + 1}.${episode['name']}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: Scaffold(body: MovieSeasonsWidget())));
}
