import '../../../../index.dart';
import 'widgets/media_detail_actors.dart';
import 'widgets/media_detail_file_info.dart';
import 'widgets/media_detail_introduce.dart';
import 'widgets/media_detail_player_button.dart';
import 'widgets/media_detail_seasons.dart';
import 'widgets/media_detail_show_info.dart';

class MediaDetailPage extends StatelessWidget {
  // final MediaDetailController controller = Get.put(MediaDetailController());

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
            MediaDetailShowInfo(),
            SizedBox(height: 10),

            // 2. 播放按钮展示模块
            MediaDetailPlayerButton(),
            SizedBox(height: 10),

            // 3. 影视集数展示模块
            MediaDetailSeasons(),
            SizedBox(height: 10),

            // 4. 简介模块
            // 添加一个mock 简介数据

            MediaDetailIntroduce(
              content: "这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介这是一个简介",
            ),
            SizedBox(height: 20),

            // 5. 演员列表展示模块
            MediaDetailActors(),
            SizedBox(height: 10),

            // 95% 宽度的横线 很细的
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(height: 10),
            // 6. 文件信息展示模块
            MediaDetailFileInfo(),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
