import 'package:flutter/material.dart';

class ScreenHorizontal extends StatelessWidget {
  const ScreenHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽高
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 标题

          Text(
            "Continue to Watching",
            style: const TextStyle(
              color: Color(0xff0a0a0a),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          // 播放器和底部控制区
          Container(
            width: screenWidth * 0.9, // 使用屏幕宽度的 90%
            // height: screenHeight * 0.95, // 使用屏幕宽度的 90%
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // 视频播放器区域
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.35, // 自适应高度
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black, // 模拟视频播放器的背景颜色
                  ),
                  child: Stack(
                    children: [
                      // 播放按钮
                      Center(
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0x33ffffff),
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                      // 播放进度条
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Container(
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0x1effffff),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [

                              const Text(
                                "00:00:12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: const Color(0x3dffffff),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "00:40:12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // 影视名称
                Text(
                  "The Falcon and The Winter Soldier",
                  style: const TextStyle(
                    color: Color(0xff0a0a0a),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                // 影视信息
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    // 评分
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffbb38),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "7.6",
                          style: TextStyle(
                            color: Color(0xffffbb38),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    // 年份
                    const Text(
                      "2021",
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 14,
                      ),
                    ),
                    // 季数
                    const Text(
                      "1 Season",
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 14,
                      ),
                    ),
                    // 集数
                    const Text(
                      "7 Episodes",
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 14,
                      ),
                    ),
                    // 类型
                    const Text(
                      "Action",
                      style: TextStyle(
                        color: Color(0xff757575),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
