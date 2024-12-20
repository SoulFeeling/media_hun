import 'package:flutter/material.dart';

import '../../../index.dart';
import '../../pages/media/media_detail_page/media_detail_page.dart';
import 'player_detail_page.dart';
import 'player_detail.dart';

class TestDemoPage extends StatelessWidget {
  const TestDemoPage({super.key});

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
          ListTile(title: const Text('影视列表'),subtitle: const Text('影视列表'),leading: const Icon(Icons.movie),onTap: () {
            Get.to(PlayerDetailsPage());
          },),
          ListTile(title: const Text('影视列表2'),subtitle: const Text('影视列表2'),leading: const Icon(Icons.movie),onTap: () {
            Get.to(MovieDetailPage());
          },),
          ListTile(title: const Text('影视列表3'),subtitle: const Text('影视列表3'),leading: const Icon(Icons.movie),onTap: () {
            Get.to(MediaDetailPage());
          },),
        ],
      ),
    );
  }
}
