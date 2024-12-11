import '/index.dart';
import '../blog/pages/blog_home_page.dart';
import '../blog/pages/chapter_knowledge_points_page.dart';
import '../blog/pages/subject_detail_page.dart';
// import '../pages/demo/CollapseDemo.dart';

class AppPages {
  static final routes = [
    // GetPage(name: AppRoutes.SPLASH, page: () => SplashPage()),
    // GetPage(name: AppRoutes.ONBOARDING, page: () => OnboardingPage()),
    // GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    // GetPage(name: AppRoutes.FOLDER, page: () => FolderPage()),
    // GetPage(name: AppRoutes.SETTINGS, page: () => SettingsPage()),
    // GetPage(name: AppRoutes.DEMO, page: () => CollapseDemo()),
    GetPage(name: AppRoutes.ROOT, page: () => BlogHomePage()),
    GetPage(name: AppRoutes.ChapterKnowledgePointsPage, page: () => ChapterKnowledgePointsPage()),
    GetPage(name: AppRoutes.SubjectDetailPage, page: () => SubjectDetailPage()),
  ];
}
