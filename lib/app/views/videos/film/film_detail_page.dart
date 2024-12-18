import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

// 模拟电影数据模型
class Movie {
  final String name;
  final String rating;
  final String releaseDate;
  final String duration;
  final String genre;
  final String fileSize;
  final String description;
  final List<String> actors;
  final List<String> relatedMovies;

  Movie({
    required this.name,
    required this.rating,
    required this.releaseDate,
    required this.duration,
    required this.genre,
    required this.fileSize,
    required this.description,
    required this.actors,
    required this.relatedMovies,
  });
}

// Controller 类
class FilmDetailController extends GetxController {
  var movie = Movie(
    name: 'Example Movie',
    rating: '8.5',
    releaseDate: '2024-12-12',
    duration: '120 min',
    genre: 'Action, Adventure',
    fileSize: '2.5 GB',
    description: 'This is an exciting action-packed movie...',
    actors: ['Actor 1', 'Actor 2', 'Actor 3'],
    relatedMovies: ['Movie A', 'Movie B', 'Movie C'],
  ).obs;

  // 模拟播放视频功能
  void playMovie() {
    print('Playing ${movie.value.name}');
  }
}

// FilmDetailPage 页面
class FilmDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film Detail'),
      ),
      body: GetX<FilmDetailController>(
        init: FilmDetailController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. 海报展示图与信息
                Stack(
                  children: [
                    Image.asset(
                      'http://192.168.1.8:9001/p2896940977.webp', // 假设海报图片路径
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.movie.value.name,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            '${controller.movie.value.rating} | ${controller.movie.value.releaseDate} | ${controller.movie.value.duration}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${controller.movie.value.genre} | ${controller.movie.value.fileSize}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // 2. 播放按钮
                Center(
                  child: ElevatedButton(
                    // onPressed: controller.playMovie,
                    onPressed: () {
                      Get.toNamed(AppRoutes.PlayerScreen, parameters: {"title": "最近播放记录", "contentType": "history"});
                    },
                    child: Text('Play Movie'),
                  ),
                ),
                SizedBox(height: 20),

                // 3. 剧情简介
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Description: ${controller.movie.value.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),

                // 4. 相关演员
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Actors:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      for (var actor in controller.movie.value.actors)
                        Text(
                          actor,
                          style: TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // 5. 列表相关其他影片
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Related Movies:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      for (var relatedMovie in controller.movie.value.relatedMovies)
                        Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(relatedMovie),
                            subtitle: Text('Duration: 120 min | File size: 2.0 GB'),
                            leading: Icon(Icons.movie),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
