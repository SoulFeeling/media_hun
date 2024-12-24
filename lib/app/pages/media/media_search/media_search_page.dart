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
        title: Container(
          height: 30, width: double.infinity,
          // color: Colors.black,
          child: Obx(
            () => TextField(
              controller: TextEditingController(text: controller.searchText.value),
              onChanged: (text) => controller.updateSearchText(text),
              decoration: InputDecoration(
                hintText: '请输入影片名称搜索',
                hintStyle: const TextStyle(color: Colors.black54),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                  size: 20,
                ),
                suffix: controller.searchText.value.isNotEmpty
                    ? Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.clear, color: Colors.black54, size: 10),
                          onPressed: () => controller.clearSearchText(),
                          padding: const EdgeInsets.all(0), // Remove padding around the icon
                          constraints: const BoxConstraints(), // Remove constraints to make the icon smaller
                        ),
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
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
