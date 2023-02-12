import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/focus_model.dart';

class HomeController extends GetxController {
  // 监听一个滚动的controller
  ScrollController scrollController = ScrollController();
  // 浮动导航开关
  RxBool flag = false.obs;
  //banner图片 需要定义成响应式数据
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // listview 滚动监听
    scrollControllerListener();
    // 请求接口
    getFocusData();
  }

  void scrollControllerListener() {
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

  // 获取banner图片列表
  getFocusData() async {
    var response = await Dio().get('https://xiaomi.itying.com/api/focus');
    print(response);
    // print(response.data is Map);
    // swiperList.value = response.data['result'];
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    update();
  }
}
