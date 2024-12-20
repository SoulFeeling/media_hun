import '../blog/pages/blog_home_page.dart';
import '../blog/pages/chapter_knowledge_points_page.dart';
import '../blog/pages/subject_detail_page.dart';
import '../pages/Demo/demo.dart';
import '../pages/media/media_detail_page/media_detail_page.dart';
import '../pages/media/media_files/media_files_page.dart';
import '../pages/media/media_files_add/media_files_add_page.dart';
import '../pages/media/media_home/media_home_page.dart';
import '../pages/media/media_list/media_list_page.dart';
import '../pages/media/media_search/media_search_page.dart';
import '../pages/media/media_settings/media_settings_page.dart';
import '../pages/player/media_player_screen.dart';
import '../pages/app_page.dart';
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
    GetPage(name: AppRoutes.DemoPage, page: () => DemoPage()),
    GetPage(name: AppRoutes.MediaHomePage, page: () => MediaHomePage()),
    GetPage(name: AppRoutes.MediaDetailPage, page: () => MediaDetailPage()),
    GetPage(name: AppRoutes.MediaFilesPage, page: () => MediaFilesPage()),
    GetPage(name: AppRoutes.MediaFilesAddTypePage, page: () => MediaFilesAddTypePage()),
    GetPage(name: AppRoutes.MediaListPage, page: () => MediaListPage()),
    GetPage(name: AppRoutes.MediaSearchPage, page: () => MediaSearchPage()),
    GetPage(name: AppRoutes.MediaSettingsPage, page: () => MediaSettingsPage()),
    GetPage(name: AppRoutes.MediaPlayerScreen, page: () => MediaPlayerScreen()),
  ];
}
