import 'package:get/get.dart';
import 'package:xmshop/app/services/cartServers.dart';

class CartController extends GetxController {
  // 购物车商品列表
  RxList cartList = [].obs;

  // 是否编辑
  RxBool showEdit = false.obs;

  // 是否全选
  RxBool checkedAll = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCartListData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCartListData() async {
    var tempList = await CartServers.getCartData();
    cartList.value = tempList!;
    checkedAll.value = isCheckedAll();
    update();
  }

  /// 改变购买数量
  changeSelectNum(Map cartItem, int num) {
    List tempList = [];
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i]['_id'] == cartItem['_id'] &&
          cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        if (cartList[i]['count'] < 1 || cartList[i]['count'] + num < 1) {
          cartList[i]['count'] = 1;
          Get.snackbar('提示', '购物车数量已经最小了');
        } else {
          cartList[i]['count'] += num;
        }
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    // 更新缓存数据
    CartServers.setCartListData(cartList);
    checkedAll.value = isCheckedAll();
    update();
  }

  /// 更改选中
  checkCartItem(Map cartItem) {
    List tempList = [];
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i]['_id'] == cartItem['_id'] &&
          cartList[i]['selectedAttr'] == cartItem['selectedAttr']) {
        cartList[i]['checked'] = !cartList[i]['checked'];
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    // 更新缓存数据
    CartServers.setCartListData(cartList);
    checkedAll.value = isCheckedAll();
    update();
  }

  /// 全选或者全不选
  checkedAllCartItem(checked) {
    checkedAll.value = checked;
    List tempList = [];
    for (int i = 0; i < cartList.length; i++) {
      cartList[i]['checked'] = checked;
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    // 更新缓存数据
    CartServers.setCartListData(cartList);
    update();
  }

  // 检测是否有全选
  isCheckedAll() {
    if (cartList.isNotEmpty) {
      for (int i = 0; i < cartList.length; i++) {
        if (!cartList[i]['checked']) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  // 更改编辑
  void changeShowEdit() {
    showEdit.value = !showEdit.value;
    update();
  }
}
