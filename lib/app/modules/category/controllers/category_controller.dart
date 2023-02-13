import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../models/category_model.dart';

class CategoryController extends GetxController {
  // 左侧选中的分类
  final RxInt selectIndex = 0.obs;

  //左侧分类列表
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  // 右侧数据
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    // 获取左侧商品列表
    getLeftCategoryList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(index, String? sId) {
    selectIndex.value = index;
    getRightCategoryList(sId!);
    update();
  }

  // 左侧商品列表
  getLeftCategoryList() async {
    var response = await Dio().get('https://xiaomi.itying.com/api/pcate');
    print(response);
    var leftCategory = CategoryModel.fromJson(response.data);
    leftCategoryList.value = leftCategory.result!;
    getRightCategoryList(leftCategoryList[0].sId);
    update();
  }

  // 获取右侧菜单列表
  getRightCategoryList(pId) async {
    var response =
        await Dio().get('https://xiaomi.itying.com/api/pcate?pid=$pId');
    print(response);
    var rightCategory = CategoryModel.fromJson(response.data);
    rightCategoryList.value = rightCategory.result!;
    update();
  }
}
