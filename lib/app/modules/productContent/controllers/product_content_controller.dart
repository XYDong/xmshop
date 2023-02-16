import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/pcontent_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../../../services/cartServers.dart';

class ProductContentController extends GetxController {
  ScrollController scrollController = ScrollController();
  // 透明度
  RxDouble opacity = 0.0.obs;

  // 顶部tba是否展示，滚动到内容区域的时候再显示
  RxBool showTabs = false.obs;

  // 顶部tab切换
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

  //详情container 的位置
  double gk2Position = 0.0;
  double gk3Position = 0.0;

  // 是否显示详情tab切换
  RxBool showSubHeaderTabs = false.obs;

  // 商品详情tab切换
  List subTabsList = [
    {
      "id": 1,
      "title": "商品介绍",
    },
    {"id": 2, "title": "规格参数"},
  ];

  // 商品详情选中
  RxInt selectSubTabsIndex = 1.obs;

  // 获取选中的属性值
  RxString selectedAttr = ''.obs;

  // 加入购物车或者购买的数量
  RxInt buyNum = 1.obs;

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
      // 获取元素渲染后的位置
      if (gk2Position == 0 && gk3Position == 0) {
        //获取Container高度的时候获取的是距离顶部的高度，如果要从0开始计算要加下滚动条下拉的高度
        getContainerPosition(scrollController.position.pixels);
      }
      //显示隐藏详情 subHeader tab切换
      // if (scrollController.position.pixels >
      //         gk2Position -
      //             ScreenAdapter.getStatusBarHeight() -
      //             ScreenAdapter.height(138) &&
      //     scrollController.position.pixels < gk3Position) {
      //   if (!showSubHeaderTabs.value) {
      //     showSubHeaderTabs.value = true;
      //   }
      // } else {
      //   if (showSubHeaderTabs.value) {
      //     showSubHeaderTabs.value = false;
      //   }
      // }
      //显示隐藏详情 subHeader tab切换
      if (scrollController.position.pixels > gk2Position &&
          scrollController.position.pixels < gk3Position) {
        if (showSubHeaderTabs.value == false) {
          showSubHeaderTabs.value = true;
          selectTabsIndex.value = 2;
          update();
        }
      } else if (scrollController.position.pixels > 0 &&
          scrollController.position.pixels < gk2Position) {
        if (showSubHeaderTabs.value == true) {
          showSubHeaderTabs.value = false;
          selectTabsIndex.value = 1;
          update();
        }
      } else if (scrollController.position.pixels > gk2Position) {
        if (showSubHeaderTabs.value == true) {
          showSubHeaderTabs.value = false;
          selectTabsIndex.value = 3;
          update();
        }
      }
      // 显示隐藏顶部tab切换
      // 获取滚动高度
      // && scrollController.position.pixels < 20
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        print(opacity.value);
        if (opacity.value > 0.978) {
          opacity.value = 1;
        }
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

  /// 获取元素位置 (固定写法)
  ///必须要元素渲染完成后才能获取
  getContainerPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    // 获取纵轴的位置
    gk2Position = box2.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.height(140) + ScreenAdapter.getStatusBarHeight());
    gk3Position = box3.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.height(140) + ScreenAdapter.getStatusBarHeight());

    print(gk2Position);
    print(gk3Position);
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
      initAttr(pContentAttr); // 初始化商品属性
      getSelectedAttr(); // 获取商品属性
      update();
    }
  }

  /// 初始化attr
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

  /// 改变选中attr
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

  /// 获取选中的值
  getSelectedAttr() {
    List temp = [];
    for (int i = 0; i < pContentAttr.length; i++) {
      for (int i1 = 0; i1 < pContentAttr[i].attrList!.length; i1++) {
        if (pContentAttr[i].attrList![i1]['checked']) {
          temp.add(pContentAttr[i].attrList![i1]['title']);
        }
      }
    }
    selectedAttr.value = temp.join(',');
    update();
  }

  /// 改变选择的商品介绍
  void changeSelectSubIndex(index) {
    selectSubTabsIndex.value = index;
    // 跳转到指定位置
    scrollController.jumpTo(gk2Position);
    update();
  }

  /// 改变购买数量
  changeSelectNum(int num) {
    if (buyNum.value < 1 || buyNum.value + num < 1) {
      buyNum.value = 1;
    } else {
      buyNum.value += num;
    }
    update();
  }

  /// 加入购物车
  addCart() {
    print('加入购物车:商品数量：${buyNum.value}');
    getSelectedAttr();
    CartServers.addCart(pContentData.value, selectedAttr.value, buyNum.value);
    Get.back();
    Get.snackbar('提示', '加入购物车成功',
        duration: const Duration(seconds: 2), snackPosition: SnackPosition.TOP);
  }

  /// 立即购买
  buyNow() {
    print('立即购买:商品数量：${buyNum.value}');
    getSelectedAttr();
    Get.back();
  }
}
