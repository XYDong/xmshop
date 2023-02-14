import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/controllers/product_content_controller.dart';

import '../../../services/screenAdapter.dart';

// 详情页面
class SecondPageView extends GetView {
  @override
  ProductContentController controller = Get.find();
  SecondPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      height: ScreenAdapter.height(1800),
      color: Colors.blue,
      child: const Center(
        child: Text(
          '详情',
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
