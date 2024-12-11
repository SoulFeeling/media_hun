import 'app/locales/AppTranslation.dart';
import 'index.dart';

Future<void> main() async {
  await GetStorage.init(); // 初始化 GetStorage
  WidgetsFlutterBinding.ensureInitialized();

  // 添加全局错误处理
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    // 你可以在这里添加自定义的错误处理逻辑
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final _storage = GetStorage();

  // 从本地存储中获取用户的语言设置

  @override
  Widget build(BuildContext context) {
    String? localeCode = _storage.read('locale');
    Locale initialLocale = _getLocaleFromString(localeCode);

    return Obx(
      () => GetMaterialApp(
        title: 'GetX Theme Demo',
        translations: AppTranslation(),
        smartManagement: SmartManagement.full, // 添加这行
        // 引入多语言翻译配置
        locale: initialLocale,
        // 默认语言
        fallbackLocale: const Locale('en', 'US'),
        // 当语言设置不符合时的备用语言
        // initialRoute: AppRoutes.SPLASH,
        initialRoute: AppRoutes.ROOT,
        getPages: AppPages.routes,
        theme: themeController.isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme,
      ),
    );
  }

  // 根据存储的语言代码返回对应的 Locale
  Locale _getLocaleFromString(String? localeCode) {
    switch (localeCode) {
      case 'zh_CN':
        return const Locale('zh', 'CN');
      case 'en_US':
      default:
        return const Locale('en', 'US');
    }
  }
}
