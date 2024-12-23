import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'media_search_controller.dart';

class MediaSearchPage extends StatelessWidget {
  final MediaSearchController controller = Get.put(MediaSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Obx(() => TextField(
          controller: TextEditingController(text: controller.searchText.value),
          onChanged: (text) => controller.updateSearchText(text),
          decoration: InputDecoration(
            hintText: '请输入影片名称搜索',
            hintStyle: TextStyle(color: Colors.black54),
            prefixIcon: Icon(Icons.search, color: Colors.black54),
            suffixIcon: controller.searchText.value.isNotEmpty
                ? Container(
              // margin: EdgeInsets.only(right: 15),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
              ),
              child: IconButton(
                icon: Icon(Icons.clear, color: Colors.black54, size: 10),
                onPressed: () => controller.clearSearchText(),
              ),
            )
                : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          ),
          style: TextStyle(color: Colors.black),
        )),
        actions: [
          Obx(() => TextButton(
            onPressed: controller.searchText.value.isNotEmpty
                ? () {
              controller.addSearchHistory(controller.searchText.value);
              // Navigate to search result page
            }
                : null,
            child: Text(
              '搜索',
              style: TextStyle(
                color: controller.searchText.value.isNotEmpty ? Colors.black : Colors.grey,
              ),
            ),
          )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => ListView.builder(
          itemCount: controller.searchHistory.length,
          itemBuilder: (context, index) {
            final item = controller.searchHistory[index];
            return ListTile(
              title: Text(item),
              onTap: () => controller.updateSearchText(item),
              trailing: Icon(Icons.history, color: Colors.grey),
            );
          },
        )),
      ),
    );
  }
}