import 'package:flutter/material.dart';

class MediaSearchPage extends StatelessWidget {

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
