import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // 监听一个滚动的controller
  ScrollController scrollController = ScrollController();
  RxBool flag = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      // 获取滚动高度
      // && scrollController.position.pixels < 20
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          flag.value = false;
          update();
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
