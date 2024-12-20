import 'package:flutter/material.dart';

class MediaDetailActors extends StatelessWidget {
  // 模拟演员数据
  final List<Map<String, String>> actors = [
    {"name": "张三", "role": "角色A", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
    {"name": "李四", "role": "角色B", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
    {"name": "王五", "role": "角色C", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
    {"name": "赵六", "role": "角色D", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
    {"name": "赵六", "role": "角色D", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
    {"name": "赵六", "role": "角色D", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
    {"name": "赵六", "role": "角色D", "imageUrl": "https://image.tmdb.org/t/p/w138_and_h175_face/djLVFETFTvPyVUdrd7aLVykobof.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '相关演员',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 150.0, // 控制单行高度
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: actors.length,
              itemBuilder: (context, index) {
                final actor = actors[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          actor['imageUrl']!,
                          width: 80.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        actor['name']!,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        actor['role']!,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
