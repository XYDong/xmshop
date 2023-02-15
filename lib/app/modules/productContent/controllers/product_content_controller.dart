import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/pcontent_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductContentController extends GetxController {
  ScrollController scrollController = ScrollController();
  // 透明度
  RxDouble opacity = 0.0.obs;

  // 顶部tba是否展示，滚动到内容区域的时候再显示
  RxBool showTabs = false.obs;

  // 商品展示内容
  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];

  // 商品展示定位
  RxInt selectTabsIndex = 1.obs;

  // 设置点击跳转到指定位置
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  // 初始化网络请求
  HttpsClient httpsClient = HttpsClient();
  // 商品详情数据
  Rx<ContentModel> pContentData = ContentModel().obs;

  // 筛选的单选实现
  RxList<PContentAttrModel> pContentAttr = <PContentAttrModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // listview 滚动监听
    scrollControllerListener();
    // 获取商品详情
    getPContentData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void scrollControllerListener() {
    scrollController.addListener(() {
      // 获取滚动高度
      // && scrollController.position.pixels < 20
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (showTabs.value && scrollController.position.pixels == 0) {
          showTabs.value = false;
        }
        update();
      } else {
        if (!showTabs.value) {
          showTabs.value = true;
          update();
        }
      }
    });
  }

  void changeSelectIndex(index) {
    selectTabsIndex.value = index;
    update();
  }

  void getPContentData() async {
    var response =
        await httpsClient.get('api/pcontent?id=${Get.arguments["id"]}');
    if (response != null) {
      var tempData = PContentModel.fromJson(response.data);
      print(response);
      pContentData.value = tempData.result!;
      pContentAttr.value = tempData.result!.attr!;
      initAttr(pContentAttr);
      update();
    }
  }

  // 初始化attr
  initAttr(RxList<PContentAttrModel> attr) {
    for (int i = 0; i < attr.length; i++) {
      for (int i1 = 0; i1 < attr[i].list!.length; i1++) {
        if (i1 == 0) {
          attr[i].attrList!.add({"title": attr[i].list![i1], "checked": true});
        } else {
          attr[i].attrList!.add({"title": attr[i].list![i1], "checked": false});
        }
      }
    }
  }

  // 改变选中attr
  changeAttr(cate, title) {
    for (int i = 0; i < pContentAttr.length; i++) {
      if (pContentAttr[i].cate == cate) {
        for (int i1 = 0; i1 < pContentAttr[i].attrList!.length; i1++) {
          pContentAttr[i].attrList![i1]['checked'] = false;
          if (pContentAttr[i].attrList![i1]['title'] == title) {
            pContentAttr[i].attrList![i1]['checked'] = true;
          }
        }
      }
    }
    update();
  }
}
