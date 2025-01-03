import '../../../index.dart';
import '../media/media_detail_page/media_detail_page.dart';
import '../player/media_player_screen.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

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
          ListTile(
            title: const Text('播放器组件'),
            onTap: () {
              Get.to(MediaPlayerScreen());
            },
          ),
          ListTile(
            title: const Text('影视详情页'),
            onTap: () {
              Get.to(MediaDetailPage());
            },
          ),
        ],
      ),
    );
  }
}
