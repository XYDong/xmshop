import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductContentController extends GetxController {
  ScrollController scrollController = ScrollController();
  // 透明度
  RxDouble opacity = 0.0.obs;

  // 顶部tba是否展示，滚动到内容区域的时候再显示
  RxBool showTabs = false.obs;

  // 商品展示内容
  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];

  // 商品展示定位
  RxInt selectTabsIndex = 1.obs;

  // 设置点击跳转到指定位置
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    // listview 滚动监听
    scrollControllerListener();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void scrollControllerListener() {
    scrollController.addListener(() {
      // 获取滚动高度
      // && scrollController.position.pixels < 20
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (showTabs.value && scrollController.position.pixels == 0) {
          showTabs.value = false;
        }
        update();
      } else {
        if (!showTabs.value) {
          showTabs.value = true;
          update();
        }
      }
    });
  }

  void changeSelectIndex(index) {
    selectTabsIndex.value = index;
    update();
  }
}
