import '/index.dart';

class ThemeController extends GetxController {
  // 定义 GetStorage 实例
  final _storage = GetStorage();

  // 存储键值
  final storageKey = 'isDarkMode';

  // 当前是否使用暗黑主题
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 从存储中读取主题设置
    isDarkMode.value = _loadThemeFromStorage();
    // 根据存储的主题初始化主题
    Get.changeTheme(isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  // 切换主题模式
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
    // 更新存储的主题设置
    _saveThemeToStorage(isDarkMode.value);
  }

  // 从存储中读取主题设置
  bool _loadThemeFromStorage() {
    return _storage.read(storageKey) ?? false;  // 默认为明亮模式
  }

  // 将主题设置存储到本地
  void _saveThemeToStorage(bool isDarkMode) {
    _storage.write(storageKey, isDarkMode);
  }
}
