import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

// 详情页面
class SecondPageView extends GetView {
  @override
  ProductContentController controller = Get.find();
  Function subHeader;
  SecondPageView(this.subHeader, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(3000),
      key: controller.gk2,
      child: Center(
        child: Column(
          children: [
            subHeader(),
          ],
        ),
      ),
    );
  }
}
