import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

// 推荐页面
class ThirdPageView extends GetView {
  @override
  ProductContentController controller = Get.find();
  ThirdPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      height: ScreenAdapter.height(1800),
      color: Colors.red,
      child: const Center(
        child: Text(
          '推荐',
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
