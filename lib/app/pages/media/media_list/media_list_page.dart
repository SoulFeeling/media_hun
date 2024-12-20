import '../../../../index.dart';
import 'media_list_controller.dart';

class MediaListPage extends StatelessWidget {
  final MediaListController controller = Get.put(MediaListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('影视列表'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Column(
              children: [
                if (controller.isFilterExpanded.value)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        filterRow('地区', ['全部', '中国', '香港', '日本', '美国', '英国', '韩国']),
                        filterRow('类型', ['全部', '科幻', '玄幻', '动作', '喜剧', '爱情']),
                        filterRow('年份', ['全部', '2024', '2023', '2022']),
                        filterRow('是否完结', ['全部', '是', '否']),
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(controller.isFilterExpanded.value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                      onPressed: controller.toggleFilter,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: controller.films.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.films.length) {
                    if (controller.hasMore.value) {
                      controller.loadFilms();
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(
                        child: Text(
                          '已经到最后一页',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                  }

                  final film = controller.films[index];
                  return filmCard(film);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterRow(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 确保多行对齐
        children: [
          // 左侧标签部分，固定宽度
          SizedBox(
            width: 80, // 统一宽度
            child: Text(
              '$label ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
          // 右侧可滑动部分
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: options
                    .map((option) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: InkWell(
                            onTap: () {
                              controller.setFilterSelection(label, option);
                            },
                            child: Obx(() {
                              bool isSelected = controller.selectedFilters[label] == option;
                              return Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    color: isSelected ? Colors.blue : Colors.black,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filmCard(Map<String, dynamic> film) {
    // 添加 onTap 事件

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.MediaDetailPage, parameters: {"title": "最近播放记录", "contentType": "history"});
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.network(
                        "http://192.168.1.8:9001/p2896940977.webp",
                        // film['imageUrl'],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            film['rating'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film['title'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        film['releaseDate'],
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
