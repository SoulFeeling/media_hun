import 'package:flutter/material.dart';
import '../../../../index.dart';
import 'widgets/widget_line_card_middle.dart';
import 'widgets/widget_line_title.dart';

class MediaHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final recentRecords = List.generate(
      10,
          (index) => {'title': '影片名称 $index', 'date': '2024-12-11', 'rating': '8.5', 'image': 'http://192.168.1.8:9001/p2896940977.webp'},
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 搜索
              Get.toNamed(AppRoutes.DemoPage);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Section(title: '最近播放记录', items: recentRecords),
            Section(title: '电视剧', items: recentRecords),
            Section(title: '电影', items: recentRecords),
            Section(title: '纪录片', items: recentRecords),
            Section(title: '动漫', items: recentRecords),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const Section({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetLineTitle(title: title),
          const SizedBox(height: 8.0),
          WidgetFilmCardMiddle(items: items),
        ],
      ),
    );
  }
}
