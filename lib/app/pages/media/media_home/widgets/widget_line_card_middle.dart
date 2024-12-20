import 'package:flutter/material.dart';

import '../../../../../index.dart';


class WidgetFilmCardMiddle extends StatelessWidget {
  final List<Map<String, String>> items;

  const WidgetFilmCardMiddle({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.FilmDetailPage, parameters: {"title": "最近播放记录", "contentType": "history"});
                    },
                    child: Container(
                      width: 100,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              children: [
                                Image.network(
                                  item['image'] ?? '',
                                  width: 100,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.6),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 4,
                                  right: 4,
                                  child: Text(
                                    item['rating'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2.0),
                                Text(
                                  item['date'] ?? '',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}