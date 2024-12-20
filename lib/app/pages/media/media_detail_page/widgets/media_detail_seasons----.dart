// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class MediaDetailController extends GetxController {
//   // 当前选中的季数 (默认为第1季)
//   var selectedSeason = 1.obs;
//
//   // 模拟每季的集数数据
//   final episodes = [
//     [
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称', 'duration': '24:36', 'progress': 0.5},
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称', 'duration': '23:20', 'progress': 0.7},
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第三集名称', 'duration': '22:50', 'progress': 0.3},
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第四集名称', 'duration': '21:00', 'progress': 1.0},
//     ],
//     [
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称', 'duration': '25:10', 'progress': 0.2},
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第二集名称', 'duration': '24:40', 'progress': 0.8},
//     ],
//     [
//       {'image': 'http://192.168.1.8:9001/p2896940977.webp', 'name': '第一集名称', 'duration': '26:00', 'progress': 0.4},
//     ],
//   ];
// }
//
// class MediaDetailSeasons extends StatelessWidget {
//   MediaDetailSeasons({super.key});
//
//   final MediaDetailController controller = Get.put(MediaDetailController());
//
//   // 转换时长为分钟:秒格式
//   String formatDuration(String? duration) {
//     if (duration == null || duration.isEmpty) {
//       return '00:00'; // 默认值
//     }
//     List<String> parts = duration.split(':');
//     if (parts.length == 2) {
//       return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
//     }
//     return '00:00'; // 返回默认值，若格式不正确
//   }
//
//   // 确保进度在 0.0 到 1.0 之间
//   double getProgress(Object? progress) {
//     if (progress is! double) {
//       return 0.0; // 默认值
//     }
//     if (progress < 0.0) return 0.0;
//     if (progress > 1.0) return 1.0;
//     return progress;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Obx(() => Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: List.generate(controller.episodes.length, (index) {
//                 int seasonNumber = index + 1;
//                 return GestureDetector(
//                   onTap: () {
//                     controller.selectedSeason.value = seasonNumber;
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 16.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           '第$seasonNumber季',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: controller.selectedSeason.value == seasonNumber ? FontWeight.bold : FontWeight.normal,
//                           ),
//                         ),
//                         if (controller.selectedSeason.value == seasonNumber)
//                           Container(
//                             margin: const EdgeInsets.only(top: 4),
//                             height: 2,
//                             width: 40,
//                             color: Colors.blue,
//                           ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           )),
//           const SizedBox(height: 10),
//           Obx(() => Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: controller.episodes[controller.selectedSeason.value - 1].length,
//               itemBuilder: (context, index) {
//                 final episode = controller.episodes[controller.selectedSeason.value - 1][index];
//                 // episode 中获取 image 字段，并复制给 imageUrl 并强制转换为字符串
//                 final imageUrl = episode['image']?.toString() ?? '';
//                 final episodeName = episode['name']?.toString() ?? '无名称';
//                 final duration = episode['duration']?.toString() ?? '';
//                 final progress = episode['progress'] ?? 0.0;
//
//                 // 确保有有效数据
//                 final formattedDuration = formatDuration(duration);
//                 final progressPercentage = getProgress(progress);
//
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 16),
//                   child: Stack(
//                     children: [
//                       // 图片展示
//                       Container(
//                         width: 160,
//                         height: 90,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           image: DecorationImage(
//                             image: NetworkImage(imageUrl),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       // 播放时间右下角
//                       Positioned(
//                         right: 8,
//                         bottom: 8,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: Colors.black54,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Text(
//                             formattedDuration,
//                             style: const TextStyle(color: Colors.white, fontSize: 12),
//                           ),
//                         ),
//                       ),
//                       // 播放按钮 (图片中央)
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             // 点击事件逻辑
//                             print("播放按钮点击，集数：$episodeName");
//                           },
//                           child: Container(
//                             width: 48,
//                             height: 48,
//                             decoration: BoxDecoration(
//                               color: Colors.black45,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(Icons.play_arrow, color: Colors.white, size: 28),
//                           ),
//                         ),
//                       ),
//                       // 播放进度条
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           height: 4,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
//                             color: Colors.black38,
//                           ),
//                           child: FractionallySizedBox(
//                             alignment: Alignment.centerLeft,
//                             widthFactor: progressPercentage,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }
