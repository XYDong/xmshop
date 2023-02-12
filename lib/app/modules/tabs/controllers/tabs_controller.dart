import 'package:get/get.dart';

class TabsController extends GetxController {
  // tabs当前的位置
  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
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
  set currentIndex(RxInt value) {
    currentIndex = value;
    // 更新数据，通知页面
    update();
  }
}
