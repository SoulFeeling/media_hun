import 'package:flutter/material.dart';

class ScreenHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: Stack(
        children: [
          // 背景图片
          Positioned.fill(
            child: Image.network(
              'http://192.168.1.8:9001/image1.png',
              fit: BoxFit.cover,
            ),
          ),

          // 顶部
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // 第一行：当前时间
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    '下午 07:00',
                    style: TextStyle(
                      fontSize: 12, // 字体小一些
                      color: Colors.white,
                    ),
                  ),
                ),
                // 第二行：返回按钮 + 影视标题
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 分配主轴上的空间
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                            onPressed: () {
                              // 返回
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            '影视标题',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera, color: Colors.white), // 截图图标
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border, color: Colors.white), // 收藏图标
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 中间显示
          Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(children: [
                    // 第一行：播放按钮 + 播放进度
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.rotate_right, size: 35, color: Colors.white),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.lock, size: 35, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ))
                  ]))),

          // 底部：进度条 + 控制按钮
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // 第一行：时间和进度条
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '00:00',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7, // 进度条更长
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                        ),
                      ),
                      Text(
                        '02:30:00',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                // 第二行：播放控制按钮
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0, top: 5),
                  // padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 左边两组图标
                      Row(
                        children: [
                          TextButton(onPressed: () {}, child: Text('1.0x', style: TextStyle(color: Colors.white))),
                          TextButton(onPressed: () {}, child: Text('原画', style: TextStyle(color: Colors.white))),
                        ],
                      ),
                      // 中间较大的图标
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.fast_rewind, size: 35, color: Colors.white),
                            onPressed: () {},
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.play_arrow, size: 40, color: Colors.white),
                            onPressed: () {},
                          ),
                          // IconButton(
                          //   icon: Icon(Icons.pause, size: 35, color: Colors.white),
                          //   onPressed: () {},
                          // ),
                          // 添加距离
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.fast_forward, size: 35, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      // 右边两组图标
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.subtitles, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.volume_up, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 顶部渐进阴影
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 底部渐进阴影
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
