import 'package:flutter/material.dart';

class MediaSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('搜索页面'),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 200, // 控制tab的宽度
                child: TabBar(
                  indicatorColor: Theme.of(context).primaryColor, // 设置指示器颜色
                  labelColor: Theme.of(context).primaryColor, // 设置标签颜色
                  unselectedLabelColor: Colors.grey, // 设置未选中标签颜色
                  tabs: [
                    Tab(text: '媒体库'),
                    Tab(text: '其他'),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MediaList(),
            MediaList(),
          ],
        ),
      ),
    );
  }
}

class MediaList extends StatelessWidget {
  final List<Map<String, String>> mediaItems = List.generate(
    10,
        (index) => {
      'title': '影片名称 $index',
      'rating': '评分: 8.5',
      'date': '上映时间: 2024-12-11',
      'region': '地区: 中国',
      'image': 'http://192.168.1.8:9001/p2896940977.webp',
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mediaItems.length,
      itemBuilder: (context, index) {
        final item = mediaItems[index];
        return ListTile(
          leading: Image.network(item['image']!),
          title: Text(item['title']!),
          subtitle: Text('${item['rating']} | ${item['date']} | ${item['region']}'),
        );
      },
    );
  }
}