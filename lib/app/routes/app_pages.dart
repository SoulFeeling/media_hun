import '../blog/pages/blog_home_page.dart';
import '../blog/pages/chapter_knowledge_points_page.dart';
import '../blog/pages/subject_detail_page.dart';
import '../views/app_page.dart';
import '../views/demo/demo_page.dart';
import '../views/players/player_screen.dart';
import '../views/videos/film/film_detail_page.dart';
import '../views/videos/film/film_home_page.dart';
import '../views/videos/film/film_list_page.dart';
import '/index.dart';


class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.HomePage, page: () => FilmHomePage()),
    GetPage(name: AppRoutes.FilmListPage, page: () => FilmListPage()),
    GetPage(name: AppRoutes.FilmDetailPage, page: () => FilmDetailPage()),
    GetPage(name: AppRoutes.PlayerScreen, page: () => PlayerScreen()),
    GetPage(name: AppRoutes.AppPage, page: () => AppPage()),
    GetPage(name: AppRoutes.ROOT, page: () => BlogHomePage()),
    GetPage(name: AppRoutes.ChapterKnowledgePointsPage, page: () => ChapterKnowledgePointsPage()),


    GetPage(name: AppRoutes.SubjectDetailPage, page: () => SubjectDetailPage()),
    GetPage(name: AppRoutes.DemoPage, page: () => TestDemoPage()),



  ];
}
