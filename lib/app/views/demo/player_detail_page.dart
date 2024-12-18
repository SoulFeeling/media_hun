import 'package:flutter/material.dart';

class PlayerDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 812,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 602,
                height: 738,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: 602,
                          height: 282,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 375,
                                    height: 282,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.white, Color(0xfff6f6f6)],
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 24,
                                          top: 48,
                                          child: Container(
                                            width: 284,
                                            height: 192,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 284,
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                  ),
                                                  padding: const EdgeInsets.only(
                                                    top: 122,
                                                    bottom: 10,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned.fill(
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                          children: [
                                                            Container(
                                                              width: 264,
                                                              height: 28,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(4),
                                                                color: Color(0x1effffff),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Positioned(
                                                                    left: 215,
                                                                    top: 8,
                                                                    child: Text(
                                                                      "00:40:12",
                                                                      textAlign: TextAlign.right,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 10,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 23,
                                                                    top: 14,
                                                                    child: Container(
                                                                      width: 180,
                                                                      height: 1,
                                                                      color: Color(0x3dffffff),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 10,
                                                                    top: 14,
                                                                    child: Container(
                                                                      width: 182,
                                                                      height: 1,
                                                                      color: Colors.white,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                        child: FlutterLogo(size: 160),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                SizedBox(
                                                  width: 276,
                                                  child: Text(
                                                    "Episode 1: The Beginning",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 24,
                                          top: 16,
                                          child: SizedBox(
                                            width: 327,
                                            child: Text(
                                              "Season 1",
                                              style: TextStyle(
                                                color: Color(0xff0a0a0a),
                                                fontSize: 16,
                                                fontFamily: "Helvetica Neue",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 231,
                                          top: 18,
                                          child: SizedBox(
                                            width: 120,
                                            child: Text(
                                              "View All",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff757575),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 284,
                                    height: 192,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 284,
                                          height: 160,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          padding: const EdgeInsets.only(
                                            top: 122,
                                            bottom: 10,
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 264,
                                                      height: 28,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(4),
                                                        color: Color(0x1effffff),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            left: 215,
                                                            top: 8,
                                                            child: Text(
                                                              "00:01:14",
                                                              textAlign: TextAlign.right,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 23,
                                                            top: 14,
                                                            child: Container(
                                                              width: 180,
                                                              height: 1,
                                                              color: Color(0x3dffffff),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 10,
                                                            top: 14,
                                                            child: Container(
                                                              width: 182,
                                                              height: 1,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: FlutterLogo(size: 160),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        SizedBox(
                                          width: 276,
                                          child: Text(
                                            "Episode 2",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 375,
                          height: 456,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 375,
                                height: 456,
                                padding: const EdgeInsets.only(
                                  bottom: 16,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 375,
                                      height: 334,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Transform.rotate(
                                            angle: 3.14,
                                            child: Container(
                                              width: 375,
                                              height: 334,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color(0x33ffffff),
                                                    Color(0x00ffffff),
                                                    Colors.white,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 84),
                                          Container(
                                            width: 375,
                                            height: 334,
                                            child: FlutterLogo(size: 334),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 327,
                                      child: Text(
                                        "The Mandalorian",
                                        style: TextStyle(
                                          color: Color(0xff0a0a0a),
                                          fontSize: 24,
                                          fontFamily: "Helvetica Neue",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 16,
                                              height: 16,
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 1,
                                                vertical: 2,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 13.34,
                                                    height: 12.67,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      color: Color(0xffffbb38),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Text(
                                              "8.8",
                                              style: TextStyle(
                                                color: Color(0xffffbb38),
                                                fontSize: 14,
                                                fontFamily: "Helvetica Neue",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 16),
                                        Text(
                                          "2019",
                                          style: TextStyle(
                                            color: Color(0xff757575),
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Text(
                                          "2 Season",
                                          style: TextStyle(
                                            color: Color(0xff757575),
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Text(
                                          "18 Episode",
                                          style: TextStyle(
                                            color: Color(0xff757575),
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Text(
                                          "Action",
                                          style: TextStyle(
                                            color: Color(0xff757575),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 327,
                                      child: Text(
                                        "After the collapse of the Galactic Empire, chaos reigned. A reclusive shooter seeks to explore the outer regions, earning his living as a bounty hunter.",
                                        style: TextStyle(
                                          color: Color(0xff757575),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 52,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0x0f000000),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    child: Stack(
                                      children: [],
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
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 375,
                height: 44,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375,
                      height: 44,
                      padding: const EdgeInsets.only(
                        left: 21,
                        right: 14,
                        top: 7,
                        bottom: 15,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 54,
                            height: 21,
                            padding: const EdgeInsets.only(
                              top: 7,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 54,
                                  child: Text(
                                    "9:41",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff0a0a0a),
                                      fontSize: 15,
                                      fontFamily: "Helvetica Neue",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 261.33),
                          Container(
                            width: 24.33,
                            height: 11.33,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 22,
                                  height: 11.33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.67),
                                    border: Border.all(
                                      color: Color(0xff0a0a0a),
                                      width: 1,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 7.33,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(1.33),
                                          color: Color(0xff0a0a0a),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 1),
                                Opacity(
                                  opacity: 0.40,
                                  child: Container(
                                    width: 1.33,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xff0a0a0a),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 375,
                height: 180,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 375,
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x00ffffff), Colors.white],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: 375,
                                height: 34,
                                color: Colors.white,
                                padding: const EdgeInsets.only(
                                  top: 21,
                                  bottom: 8,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Opacity(
                                      opacity: 0.80,
                                      child: Container(
                                        width: 134,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Color(0xff0a0a0a),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 77,
                            child: Container(
                              width: 375,
                              height: 69,
                            ),
                          ),
                          Positioned(
                            left: 24,
                            top: 88,
                            child: Container(
                              width: 327,
                              height: 48,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 269,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xff048bf8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: [],
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "Continue Watch S2E4",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Color(0x1e000000),
                                        width: 1.50,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 24,
                                              height: 24,
                                              child: Stack(
                                                children: [],
                                              ),
                                            ),
                                          ],
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
                    ),
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
