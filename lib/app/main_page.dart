// import '/index.dart';
//
// class MainPage extends StatelessWidget {
//   final MainController mainController = Get.put(MainController());
//   final ThemeController themeController = Get.find();
//
//   final List<Widget> pages = [
//     HomePage(),
//     // BookStorePage(),
//     FolderPage(),
//     SettingsPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('GetX Navigation Demo'),
//       //   actions: [
//       //     Obx(() => Switch(
//       //           value: themeController.isDarkMode.value,
//       //           onChanged: (value) {
//       //             themeController.toggleTheme();
//       //           },
//       //         )),
//       //   ],
//       // ),
//       body: Obx(() => pages[mainController.currentIndex.value]),
//       bottomNavigationBar: const BottomNavigation(),
//     );
//   }
// }
