import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productContent/views/first_page_view.dart';
import 'package:xmshop/app/modules/productContent/views/second_page_view.dart';
import 'package:xmshop/app/modules/productContent/views/third_page_view.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

  Widget _appBar(context) {
    return Obx(() => AppBar(
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
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  // shadowColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${e['title']}',
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(42),
                                          fontWeight: e['id'] ==
                                                  controller
                                                      .selectTabsIndex.value
                                              ? FontWeight.bold
                                              : FontWeight.normal),
                                    ),
                                    controller.selectTabsIndex == e['id']
                                        ? Container(
                                            width: ScreenAdapter.width(70),
                                            height: ScreenAdapter.width(6),
                                            margin: EdgeInsets.only(
                                                top: ScreenAdapter.height(5)),
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
                                        duration:
                                            const Duration(milliseconds: 300));
                                    break;
                                  case 2:
                                    Scrollable.ensureVisible(
                                        controller.gk2.currentContext
                                            as BuildContext,
                                        duration:
                                            const Duration(milliseconds: 300));
                                    break;
                                  case 3:
                                    Scrollable.ensureVisible(
                                        controller.gk3.currentContext
                                            as BuildContext,
                                        duration:
                                            const Duration(milliseconds: 300));
                                    break;
                                }
                              },
                            ))
                        .toList(),
                  )
                : const SizedBox()),
          ),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(controller.opacity.value),
          // 透明状态栏  withOpacity 可以改变透明度 实现透明导航
          elevation: 0,
          // 阴影 实现透明导航
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
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  // shadowColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
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
                onPressed: () {
                  showMenu(
                      color: Colors.black87.withOpacity(0.7),
                      context: context,
                      position: RelativeRect.fromLTRB(ScreenAdapter.width(800),
                          ScreenAdapter.width(200), 0, 0),
                      items: [
                        PopupMenuItem(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.home, color: Colors.white),
                            Text(
                              '首页',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                        PopupMenuItem(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.message, color: Colors.white),
                            Text('消息', style: TextStyle(color: Colors.white)),
                          ],
                        )),
                        PopupMenuItem(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.favorite, color: Colors.white),
                            Text('收藏', style: TextStyle(color: Colors.white)),
                          ],
                        )),
                      ]);
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  // shadowColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
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
        ));
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          FirstPageView(showAttr),
          SecondPageView(),
          ThirdPageView(),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          height: ScreenAdapter.height(200),
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(width: 2, color: Colors.black12))),
          child: Row(
            children: [
              SizedBox(
                width: ScreenAdapter.width(200),
                height: ScreenAdapter.height(160),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart),
                    Text(
                      "购物车",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  onPressed: () {
                    showAttr();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 165, 0, 0.9)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          // CircleBorder()
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: const Text('加入购物车'),
                ),
              )),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                child: ElevatedButton(
                  onPressed: () {
                    showAttr();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(253, 1, 0, 0.9)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          // CircleBorder()
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: const Text('立即购买'),
                ),
              )),
            ],
          ),
        ));
  }

  void showAttr() {
    // 在bottomsheet里边更新流数据，需要使用GetBuilder，直接使用obx 是无效的
    Get.bottomSheet(GetBuilder<ProductContentController>(
      init: controller,
      builder: (controller) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          width: double.infinity,
          height: ScreenAdapter.height(1200),
          child: ListView(
            children: [
              Wrap(
                children: controller.pContentData.value.attr!
                    .map((value) => Wrap(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20),
                                  left: ScreenAdapter.width(20)),
                              width: ScreenAdapter.width(1040),
                              child: Text("${value.cate}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20),
                                  left: ScreenAdapter.width(20)),
                              width: ScreenAdapter.width(1040),
                              child: Wrap(
                                children: value.attrList!
                                    .map((e) => Container(
                                          margin: EdgeInsets.all(
                                              ScreenAdapter.width(20)),
                                          child: InkWell(
                                            child: Chip(
                                                padding: EdgeInsets.only(
                                                    left:
                                                        ScreenAdapter.width(20),
                                                    right: ScreenAdapter.width(
                                                        20)),
                                                backgroundColor: e['checked']
                                                    ? const Color.fromARGB(
                                                        255, 227, 15, 15)
                                                    : const Color.fromARGB(
                                                        31, 223, 213, 213),
                                                label: Text('${e['title']}')),
                                            onTap: () {
                                              controller.changeAttr(
                                                  value.cate, e['title']);
                                            },
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              )
            ],
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // body内容从状态栏开始，而不是从appbar 开始 实现透明导航
      // appBar 不能直接加obx, 需要使用PreferredSize 包装一下
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenAdapter.width(140)),
          child: _appBar(context)),
      body: Stack(
        children: [
          _body(),
          _bottom(),
        ],
      ),
    );
  }
}
