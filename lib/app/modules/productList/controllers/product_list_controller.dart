import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductListController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  // 商品列表
  RxList<PlistItemModel> plist = <PlistItemModel>[].obs;
  // 页码
  int page = 1;
  int pageSize = 8;
  // 上拉加载更多
  ScrollController scrollController = ScrollController();
  // 加载更多的开关 解决上拉时重复请求的问题
  RxBool flag = true.obs;
  // 是否有更多数据
  RxBool hasData = true.obs;

  @override
  void onInit() {
    super.onInit();
    // 获取商品列表数据
    getPListData();
    initScrollerListener();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getPListData() async {
    if (flag.value && hasData.value) {
      flag.value = false;
      var response = await httpsClient.get(
          "api/plist?cid=${Get.arguments['cId']}&page=$page&pageSize=$pageSize");
      if (response != null) {
        var plistTemp = PlistModel.fromJson(response.data);
        // 注意拼接数据
        plist.addAll(plistTemp.result!);
        page++;
        flag.value = true;
        if (plistTemp.result!.length < pageSize) {
          hasData.value = false;
        }
        update();
      }
    }
  }

  void initScrollerListener() {
    scrollController.addListener(() {
      // scrollController.position.pixels 滚动条下拉的高度
      // scrollController.position.maxScrollExtent 页面的高度
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 20) {
        getPListData();
      }
    });
  }
}
