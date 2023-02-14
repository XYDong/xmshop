import 'package:get/get.dart';

import '../../../services/searchServers.dart';

class SearchController extends GetxController {
  // 输入框内容
  String keyWords = '';

  RxList searchHistoryList = [].obs;

  @override
  void onInit() {
    super.onInit();
    // 获取搜索历史记录
    getSearchHistoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toSearch() {
    // Get.toNamed('/product-list',
    //     arguments: {"keyWords": controller.keyWords});
    Get.offAndToNamed('/product-list', arguments: {"keyWords": keyWords});
    // 保存搜索记录
    SearchServers.setHistoryData(keyWords);
  }

  void getSearchHistoryData() async {
    searchHistoryList.addAll(await SearchServers.getHistoryData());
    update();
  }

  void clearSearchHistoryData() async {
    SearchServers.clearHistoryData();
    searchHistoryList.clear();
    update();
  }

  void deleteSearchHistoryData(keyWords) async {
    await SearchServers.deleteHistoryData(keyWords);
    searchHistoryList.clear();
    getSearchHistoryData();
  }
}
