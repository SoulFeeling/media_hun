import 'package:media_hub/index.dart';

class MediaSearchController extends GetxController {
  var searchText = ''.obs;
  var searchHistory = <String>[].obs;

  void updateSearchText(String text) {
    searchText.value = text;
  }

  void addSearchHistory(String text) {
    if (!searchHistory.contains(text)) {
      searchHistory.add(text);
    }
  }

  void clearSearchText() {
    searchText.value = '';
  }
}