import 'package:xmshop/app/services/storage.dart';

class SearchServers {
  // 保存历史搜索记录
  static setHistoryData(keyWords) async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData != null) {
      if (!searchListData.any((element) => keyWords == element)) {
        searchListData.add(keyWords);
        await Storage.setData('searchList', searchListData);
      }
    } else {
      List tempList = [];
      tempList.add(keyWords);
      await Storage.setData('searchList', tempList);
    }
  }

  //获取历史搜索记录
  static getHistoryData() async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData != null) {
      return searchListData;
    } else {
      return [];
    }
  }

  // 删除历史搜索记录
  static deleteHistoryData(keyWords) async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData!.any((element) => element == keyWords)) {
      searchListData.remove(keyWords);
      await Storage.setData('searchList', searchListData);
    }
  }

  // 情况历史搜索记录
  static clearHistoryData() async {
    await Storage.clear('searchList');
  }
}
