import 'package:get/get.dart';
import 'package:xmshop/app/services/cartServers.dart';

class CartController extends GetxController {
  RxList cartList = [].obs;
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
    update();
  }
}
