import 'package:flutter/material.dart';

import '../../../../index.dart';
import '../media_detail_controller.dart';

class MediaDetailIntroduce extends StatelessWidget {
  const MediaDetailIntroduce({super.key});


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        '电影简介：这是一部描述......',
        style: TextStyle(fontSize: 16),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
