import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // body内容从状态栏开始，而不是从appbar 开始 实现透明导航
      // appBar 不能直接加obx, 需要使用PreferredSize 包装一下
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenAdapter.width(140)),
          child: Obx(() => AppBar(
                leading: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        // shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                ),
                title: SizedBox(
                  width: ScreenAdapter.width(400),
                  height: ScreenAdapter.height(96),
                  child: Obx(() => controller.showTabs.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: controller.tabsList
                              .map((e) => InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${e['title']}',
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(42),
                                                fontWeight: e['id'] ==
                                                        controller
                                                            .selectTabsIndex
                                                            .value
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                          ),
                                          controller.selectTabsIndex == e['id']
                                              ? Container(
                                                  width:
                                                      ScreenAdapter.width(70),
                                                  height:
                                                      ScreenAdapter.width(6),
                                                  margin: EdgeInsets.only(
                                                      top: ScreenAdapter.height(
                                                          5)),
                                                  color: Colors.red,
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      controller.changeSelectIndex(e['id']);
                                      switch (e['id']) {
                                        case 1:
                                          Scrollable.ensureVisible(
                                              controller.gk1.currentContext
                                                  as BuildContext,
                                              duration: const Duration(
                                                  milliseconds: 300));
                                          break;
                                        case 2:
                                          Scrollable.ensureVisible(
                                              controller.gk2.currentContext
                                                  as BuildContext,
                                              duration: const Duration(
                                                  milliseconds: 300));
                                          break;
                                        case 3:
                                          Scrollable.ensureVisible(
                                              controller.gk3.currentContext
                                                  as BuildContext,
                                              duration: const Duration(
                                                  milliseconds: 300));
                                          break;
                                      }
                                    },
                                  ))
                              .toList(),
                        )
                      : const SizedBox()),
                ),
                centerTitle: true,
                backgroundColor: Colors.white.withOpacity(controller
                    .opacity.value), // 透明状态栏  withOpacity 可以改变透明度 实现透明导航
                elevation: 0, // 阴影 实现透明导航
                actions: [
                  Container(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        // shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      child: const Icon(
                        Icons.file_upload_outlined,
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        // shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      child: const Icon(
                        Icons.more_horiz_rounded,
                      ),
                    ),
                  ),
                ],
              ))),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            Container(
              key: controller.gk1,
              height: ScreenAdapter.height(900),
              color: Colors.orange,
              child: Center(
                child: Text(
                  '商品',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Container(
              key: controller.gk2,
              height: ScreenAdapter.height(1800),
              color: Colors.blue,
              child: Center(
                child: Text(
                  '详情',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Container(
              key: controller.gk3,
              height: ScreenAdapter.height(1800),
              color: Colors.red,
              child: Center(
                child: Text(
                  '推荐',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
