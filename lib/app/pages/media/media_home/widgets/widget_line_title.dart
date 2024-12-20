import 'package:flutter/material.dart';

import '../../../../../index.dart';




class WidgetLineTitle extends StatelessWidget {
  final String title;

  const WidgetLineTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: () {
              // 跳转
              Get.toNamed(
                AppRoutes.MediaListPage,
                parameters: {"title": title, "contentType": "history"},
              );
            },
            child: const Text(
              '全部 163 >',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}