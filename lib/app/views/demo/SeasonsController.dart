import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeasonsController extends GetxController {
  // 当前选中的季数 (默认为第1季)
  var selectedSeason = 1.obs;

  // 模拟每季的集数数据
  final episodes = [
    // 第1季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第三集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第四集名称'},
    ],
    // 第2季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第三集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第四集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第五集名称'},
    ],
    // 第3季
    [
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第三集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第四集名称'},
      {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第五集名称'},
    ],
  ];
}