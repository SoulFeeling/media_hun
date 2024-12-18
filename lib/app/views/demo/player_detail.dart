import '../../../index.dart';
import 'SeasonsController.dart';

class MovieDetailPage extends StatelessWidget {
  final SeasonsController controller = Get.put(SeasonsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('影视详情'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 展示图片模块
            SizedBox(
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
            ),

            SizedBox(height: 10),

            // 2. 播放按钮展示模块
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // 跳转到视频播放页面
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
            ),
            SizedBox(height: 20),

            // 3. 影视集数展示模块
            SizedBox(
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
                                        fontWeight: controller.selectedSeason.value == seasonNumber ? FontWeight.bold : FontWeight.normal,
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
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: controller.episodes[controller.selectedSeason.value - 1].length,
                          itemBuilder: (context, index) {
                            final episode = controller.episodes[controller.selectedSeason.value - 1][index];
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
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '集数: 12集',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // 4. 简介模块
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '电影简介：这是一部描述......',
                style: TextStyle(fontSize: 16),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 20),

            // 5. 演员列表展示模块
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '主演: 张三, 李四, 王五',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // 6. 文件信息展示模块
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '文件信息: 格式 - MP4, 分辨率 - 1080p, 文件大小 - 2GB',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

