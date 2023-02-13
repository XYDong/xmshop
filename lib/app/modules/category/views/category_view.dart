import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/httpsClient.dart';
import '../../../services/screenAdapter.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                  child: const Icon(Icons.search),
                ),
                Text(
                  '手机',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(32)),
                ),
              ],
            ),
            onTap: () {
              Get.toNamed('/search');
            },
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message_outlined,
                color: Colors.black45,
              )),
        ],
      ),
      body: Row(
        children: [
          _leftCate(),
          _rightCate(),
        ],
      ),
    );
  }

  Widget _leftCate() {
    return SizedBox(
      width: ScreenAdapter.width(300),
      height: double.infinity,
      child: Obx(() => ListView.builder(
          itemCount: controller.leftCategoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: SizedBox(
                width: double.infinity,
                height: ScreenAdapter.height(160),
                child: Obx(() => Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: ScreenAdapter.width(10),
                            height: ScreenAdapter.height(46),
                            color: controller.selectIndex.value == index
                                ? Colors.orange
                                : Colors.white,
                            margin: EdgeInsets.fromLTRB(
                                ScreenAdapter.width(20), 0, 0, 0),
                          ),
                        ),
                        Center(
                          child: Text(
                            '${controller.leftCategoryList[index].title}',
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(36),
                                fontWeight:
                                    controller.selectIndex.value == index
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                        ),
                      ],
                    )),
              ),
              onTap: () {
                controller.changeIndex(
                    index, controller.leftCategoryList[index].sId);
              },
            );
          })),
    );
  }

  Widget _rightCate() {
    return Expanded(
        child: Container(
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(10), 0, 0, 0),
      height: double.infinity,
      child: Obx(() => GridView.builder(
          itemCount: controller.rightCategoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: ScreenAdapter.width(40),
              mainAxisSpacing: ScreenAdapter.height(20),
              childAspectRatio: 240 / 346),
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Image.network(
                      HttpsClient.replaceUri(
                          controller.rightCategoryList[index].pic),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(0, ScreenAdapter.height(10), 0, 0),
                    child: Text(
                      '${controller.rightCategoryList[index].title}',
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed('/product-list', arguments: {
                  "cId": controller.rightCategoryList[index].sId
                });
              },
            );
          })),
    ));
  }
}
