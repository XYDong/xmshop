import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldGlobalKey, // 必须要配置这个，否则点击不生效
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(910),
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
                  child: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  (controller.keyWords != null) ? '${controller.keyWords}' : "",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(32)),
                ),
              ],
            ),
            onTap: () {
              Get.offAndToNamed('/search');
            },
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // 将顶部的抽屉按钮隐藏
        actions: const [SizedBox()],
      ),
      body: Obx(() => controller.plist.isNotEmpty
          ? Stack(
              children: [
                _productListWidget(),
                _subHeaderWidget(),
              ],
            )
          : _processIndicator()),
      endDrawer: const Drawer(
        child: DrawerHeader(
          child: Text('text'),
        ),
      ),
    );
  }

  // 顶部菜单
  Widget _subHeaderWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)))),
        child: Obx(() => Row(
              children: controller.plist.isNotEmpty
                  ? controller.subHeaderList
                      .map((value) => Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0,
                                        ScreenAdapter.height(16),
                                        0,
                                        ScreenAdapter.height(16)),
                                    child: Text(
                                      '${value['title']}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              controller.selectHeaderId.value ==
                                                      value['id']
                                                  ? Colors.red
                                                  : Colors.black54,
                                          fontSize: ScreenAdapter.fontSize(32)),
                                    ),
                                  ),
                                  onTap: () {
                                    controller.subHeaderChange(value);
                                  },
                                ),
                                _showIcon(value['id']),
                              ],
                            ),
                          ))
                      .toList()
                  : [],
            )),
      ),
    );
  }

  // 商品列表
  Widget _productListWidget() {
    return ListView.builder(
        controller: controller.scrollController,
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(26),
            ScreenAdapter.height(140),
            ScreenAdapter.width(26),
            ScreenAdapter.height(26)),
        itemCount: controller.plist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    // 左侧
                    Container(
                      padding: EdgeInsets.all(ScreenAdapter.width(20)),
                      width: ScreenAdapter.width(400),
                      height: ScreenAdapter.height(460),
                      child: Image.network(
                        HttpsClient.replaceUri(controller.plist[index].pic),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    // 右侧
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 0, 0, ScreenAdapter.height(20)),
                            child: Text(
                              '${controller.plist[index].title}',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 0, 0, ScreenAdapter.height(20)),
                            child: Text(
                              '${controller.plist[index].subTitle}',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: ScreenAdapter.height(20)),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Text("CUP",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            fontWeight: FontWeight.bold)),
                                    Text("Helio G25",
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34),
                                        ))
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Text("高清拍摄",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            fontWeight: FontWeight.bold)),
                                    Text("1300万像素",
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34),
                                        ))
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Text("超大屏",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34),
                                            fontWeight: FontWeight.bold)),
                                    Text("6.1寸",
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34),
                                        ))
                                  ],
                                ))
                              ],
                            ),
                          ),
                          Text(
                            '￥${controller.plist[index].price}元',
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(34),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              (index == controller.plist.length - 1)
                  ? _processIndicator()
                  : const SizedBox(
                      height: 0,
                    ),
            ],
          );
        });
  }

  // 加载更多的loading
  Widget _processIndicator() {
    return controller.hasData.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const Center(
            child: Text('没有更多数据了'),
          );
  }

  // 箭头组件
  Widget _showIcon(id) {
    //controller.subHeaderListSort 作用 : 响应式状态  为了改变状态
    if (id == 2 ||
        id == 3 ||
        controller.subHeaderListSort.value == 1 ||
        controller.subHeaderListSort.value == -1) {
      if (controller.subHeaderList[id - 1]['sort'] == 1) {
        return const Icon(Icons.arrow_drop_down, color: Colors.black54);
      } else {
        return const Icon(Icons.arrow_drop_up, color: Colors.black54);
      }
    } else {
      return const SizedBox();
    }
  }
}
