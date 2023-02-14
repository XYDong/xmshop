import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductListController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  // 商品列表
  RxList<PlistItemModel> plist = <PlistItemModel>[].obs;
  // 页码
  int page = 1;
  int pageSize = 8;
  // 上拉加载更多
  ScrollController scrollController = ScrollController();
  // 加载更多的开关 解决上拉时重复请求的问题
  RxBool flag = true.obs;
  // 是否有更多数据
  RxBool hasData = true.obs;
  // 筛选弹出的key (需要绑定ScaffoldState，这样才能回去里边的widget)
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  // 用于排序
  String sort = '';

  /*二级导航数据*/
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
          -1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;

  // 解决同一分类数据多次点击无法排序的问题
  RxInt subHeaderListSort = 0.obs;

  // 获取传值
  String? keyWords = Get.arguments['keyWords'];

  String? cId = Get.arguments['cId'];

  String apiUri = '';

  @override
  void onInit() {
    super.onInit();
    // 获取商品列表数据
    getPListData();
    initScrollerListener();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取商品列表
  getPListData() async {
    if (cId == null) {
      apiUri = apiUri =
          "api/plist?search=$keyWords&page=$page&pageSize=$pageSize&sort=$sort";
    } else {
      apiUri = "api/plist?cid=$cId&page=$page&pageSize=$pageSize&sort=$sort";
    }
    if (flag.value && hasData.value) {
      flag.value = false;
      var response = await httpsClient.get(apiUri);
      if (response != null) {
        var plistTemp = PlistModel.fromJson(response.data);
        // 注意拼接数据
        plist.addAll(plistTemp.result!);
        page++;
        flag.value = true;
        if (plistTemp.result!.length < pageSize) {
          hasData.value = false;
        }
        update();
      }
    }
  }

  // 滚动监听
  void initScrollerListener() {
    scrollController.addListener(() {
      // scrollController.position.pixels 滚动条下拉的高度
      // scrollController.position.maxScrollExtent 页面的高度
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 20) {
        getPListData();
      }
    });
  }

  // 点击顶部菜单的操作
  void subHeaderChange(value) {
    selectHeaderId.value = value['id'];
    if (selectHeaderId.value == 4) {
      scaffoldGlobalKey.currentState!.openEndDrawer();
    } else {
      sort = '${value['fileds']}_${value['sort']}';
      // 切换排序
      value['sort'] = value['sort'] * -1;
      subHeaderListSort.value = value['sort'] * -1;
      // 重置数据
      page = 1;
      hasData.value = true;
      flag.value = true;
      plist.value = [];
      getPListData();
    }
    update();
  }
}
