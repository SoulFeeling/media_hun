import 'package:get_storage/get_storage.dart';

class StorageService {
  final box = GetStorage();

  void saveSubject(String key, String value) {
    box.write(key, value);
  }

  String? getSubject(String key) {
    return box.read(key);
  }

  void removeSubject(String key) {
    box.remove(key);
  }

// 可以添加更多本地存储相关的方法
}
