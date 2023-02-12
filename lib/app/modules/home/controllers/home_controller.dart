import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/plist_model.dart';

class HomeController extends GetxController {
  // 监听一个滚动的controller
  ScrollController scrollController = ScrollController();
  // 浮动导航开关
  RxBool flag = false.obs;
  //banner图片 需要定义成响应式数据
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
// 首页商品分类列表
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  //热销轮播图
  RxList<FocusItemModel> bestSellingList = <FocusItemModel>[].obs;
  //热销商品列表
  RxList<PlistItemModel> sellingList = <PlistItemModel>[].obs;
  //省心优惠商品列表
  RxList<PlistItemModel> bestPlist = <PlistItemModel>[].obs;
  // 省心优惠商品列表的页数
  RxInt page = 1.obs;

  @override
  void onInit() {
    super.onInit();
    // listview 滚动监听
    scrollControllerListener();
    // 请求接口 轮播图
    getFocusData();
    // 商品分类
    getCategoryData();
    // 热销轮播图
    getBestSellingListData();
    // 获取热销商品列表
    getsSellingListData();
    // 获取热门商品
    getBestPlistData();
  }

  void scrollControllerListener() {
    scrollController.addListener(() {
      // 获取滚动高度
      // && scrollController.position.pixels < 20
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          flag.value = false;
          update();
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取banner图片列表
  getFocusData() async {
    var response = await Dio().get('https://xiaomi.itying.com/api/focus');
    print(response);
    // print(response.data is Map);
    // swiperList.value = response.data['result'];
    var focus = FocusModel.fromJson(response.data);
    swiperList.value = focus.result!;
    update();
  }

  // 获取banner图片列表
  getCategoryData() async {
    var response = await Dio().get('https://xiaomi.itying.com/api/bestCate');
    print(response);
    var category = CategoryModel.fromJson(response.data);
    categoryList.value = category.result!;
    update();
  }

  // 获取热销中的轮播图
  getBestSellingListData() async {
    var response =
        await Dio().get('https://xiaomi.itying.com/api/focus?position=2');
    print(response);
    var bestSelling = FocusModel.fromJson(response.data);
    bestSellingList.value = bestSelling.result!;
    update();
  }

  // 获取热销商品列表
  getsSellingListData() async {
    var response = await Dio()
        .get('http://xiaomi.itying.com/api/plist?is_hot=1&pageSize=3');
    print(response);
    var selling = PlistModel.fromJson(response.data);
    sellingList.value = selling.result!;
    update();
  }

  //获取热门商品数据
  getBestPlistData() async {
    var response =
        await Dio().get("https://xiaomi.itying.com/api/plist?is_best=1");
    var plist = PlistModel.fromJson(response.data);
    bestPlist.value = plist.result!;
    update();
  }
}
