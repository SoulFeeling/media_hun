import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../controllers/api_domain_controller.dart';
import '../controllers/home_controller.dart';
import '../models/category_model.dart';
import '../services/api_service.dart';

class BlogHomePage extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());
  final ApiDomainController apiDomainController = Get.put(ApiDomainController());
  final apiService = ApiService();


  // 背景颜色集合
  final List<Color> backgroundColors = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.book, color: Colors.black),
            SizedBox(width: 8),
            Text(
              "复习宝典",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF0F8FF),
        actions: [
          TextButton(onPressed: () {}, child: Text("首页", style: TextStyle(color: Colors.black))),
          TextButton(onPressed: () {}, child: Text("我的课程", style: TextStyle(color: Colors.black))),
          TextButton(onPressed: () {
            apiDomainController.switchDomain(); // 切换到新域名
            apiService.updateBaseUrl(); // 更新 ApiService 的 baseUrl
            final String currentDomain = apiDomainController.currentDomain.value;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('当前地址已切换为: $currentDomain'),
                duration: Duration(seconds: 2),
              ),
            );

          }, child: Text("切换环境", style: TextStyle(color: Colors.black))),
          TextButton(onPressed: () {
            _controller.fetchCategories();
          }, child: const Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          if (_controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              // 动态生成分类标题区
              ..._controller.categories.map((category) {
                final subjectsInCategory = category.subjects;
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category.categoryName,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                          ),
                          Text(
                            '${subjectsInCategory?.length}个科目',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    // 分类分隔线，使用渐变色
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent.withOpacity(0.4), Colors.greenAccent.withOpacity(0.4)],
                        ),
                      ),
                    ),
                    // 科目显示组件
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 每行显示4个科目
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: subjectsInCategory?.length,
                      itemBuilder: (context, index) {
                        final subject = subjectsInCategory?[index];
                        final String? iconUrl = subject?.icon;
                        final backgroundColor = backgroundColors[index % backgroundColors.length]; // 按顺序选择背景色
                        return GestureDetector(
                          onTap: () {
                            // 点击事件示例
                            print("Selected subject: ${subject?.subjectId},  ${subject?.subjectName}");
                            // 使用getx 跳转到 SubjectDetailPage页面，有构造函数入参
                            // Get.toNamed(AppRoutes.SubjectDetailPage, arguments: {
                            //   'subjectId': subject?.subjectId,
                            //   'subjectName': subject?.subjectName,
                            // });

                            Get.toNamed(AppRoutes.SubjectDetailPage, arguments: {
                              'subjectId': subject?.subjectId.toString(),
                              'subjectName': subject?.subjectName,
                            });
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25, // 图标大小
                                backgroundColor: backgroundColor.withOpacity(0.2), // 背景颜色
                                child: (iconUrl == null || iconUrl.isEmpty)
                                    ? Icon(Icons.book, size: 20, color: Colors.white) // 默认图标
                                    : SvgPicture.network(
                                  iconUrl,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ), // 使用 SVG 图标
                              ),
                              SizedBox(height: 6), // 缩小间距
                              Text(
                                subject?.subjectName ?? 'Unknown',
                                style: TextStyle(fontSize: 12, color: Colors.black), // 缩小字体
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }).toList(),
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF0F8FF),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "我的课程"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "个人中心"),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: "更多"),
        ],
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.black,
        currentIndex: 0, // 默认选中首页
        onTap: (index) {
          // 底部导航点击事件
          print("Navigated to tab: $index");
        },
      ),
    );
  }
}
