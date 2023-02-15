import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/controllers/product_content_controller.dart';

// 详情页面
class SecondPageView extends GetView {
  @override
  ProductContentController controller = Get.find();
  Function subHeader;
  SecondPageView(this.subHeader, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      child: Center(
        child: Column(
          children: [
            Obx(() => subHeader()),
            Obx(() => controller.selectSubTabsIndex.value == 1
                ? Container(
                    alignment: Alignment.center,
                    child: Html(
                      data: controller.pContentData.value.content,
                      style: {
                        "body": Style(backgroundColor: Colors.white),
                        "p": Style(fontSize: FontSize.large)
                      },
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child:
                        Html(data: controller.pContentData.value.specs, style: {
                      "body": Style(backgroundColor: Colors.white),
                      "p": Style(fontSize: FontSize.large)
                    }),
                  ))
          ],
        ),
      ),
    );
  }
}
