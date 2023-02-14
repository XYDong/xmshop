import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductContentController extends GetxController {
  ScrollController scrollController = ScrollController();
  // 透明度
  RxDouble opacity = 0.0.obs;

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
        update();
      }
    });
  }
}
