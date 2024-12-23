import 'package:flutter/material.dart';
import 'package:media_hub/index.dart';

import 'media_history_controller.dart';

class MediaHistoryPage extends StatelessWidget {
  final MediaHistoryController controller = Get.put(MediaHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资源库'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 95% 宽度的横线 很细的
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
