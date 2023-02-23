import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:xmshop/app/modules/cart/views/cart_view.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/give/views/give_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';
import 'package:xmshop/app/modules/user/views/user_view.dart';

class TabsController extends GetxController {
  // tabs当前的位置
  RxInt currentIndex = 0.obs;
  final List<Widget> pages = [
    const HomeView(),
    const CategoryView(),
    const GiveView(),
    CartView(),
    const UserView(),
  ];
  // 页面左右切换
  PageController pageController = Get.arguments != null
      ? PageController(initialPage: Get.arguments["initialPage"])
      : PageController(initialPage: 0);

  @override
  void onInit() {
    if (Get.arguments != null) {
      currentIndex.value = Get.arguments["initialPage"];
      update();
    }
    initJPush();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 更新index
  void setCurrentIndex(value) {
    currentIndex.value = value;
    // 更新数据，通知页面
    update();
  }

  void initJPush() {
    print('极光推送初始化');
    JPush jPush = JPush();
    jPush.setup(
      appKey: "db6f6dd4779019d7b83c3b58",
      channel: "flutter_channel",
      production: false,
      debug: true, //是否打印debug日志
    );
    // 获取注册id
    jPush.getRegistrationID().then((rid) {
      print("极光推送 flutter getRegistrationID: $rid");
    });
    jPush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
  }
}
