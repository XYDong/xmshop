import 'package:get/get.dart';

import '../../../services/cartServers.dart';
import '../../../services/storage.dart';
import '../../../services/userServices.dart';

class CartController extends GetxController {
  // 购物车商品列表
  RxList cartList = [].obs;

  // 是否编辑
  RxBool isEdit = false.obs;

  // 是否全选
  RxBool checkedAll = false.obs;

  // 商品总价
  RxDouble allPrice = 0.0.obs;
  // 商品总数
  RxInt allCount = 0.obs;

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
    computedAllPrice();
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
    computedAllPrice();
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
    computedAllPrice();
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
  void changeIsEdit() {
    isEdit.value = !isEdit.value;
    update();
  }

  //获取要结算的商品
  getCheckListData() {
    List tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["checked"] == true) {
        tempList.add(cartList[i]);
      }
    }
    return tempList;
  }

  //判断用户有没有登录
  Future<bool> isLogin() async {
    return await UserServices.getUserLoginState();
  }

  checkout() async {
    bool loginState = await isLogin();
    List checkListData = getCheckListData();
    computedAllPrice();
    if (loginState) {
      //判断购物车里面有没有要结算的商品
      if (checkListData.isNotEmpty) {
        Storage.setData('checkoutList', checkListData);
        Get.toNamed("/checkout");
      } else {
        Get.snackbar("提示信息!", "购物车中没有要结算的商品");
      }
    } else {
      //执行跳转
      Get.toNamed("/code-login-step-one");
      Get.snackbar("提示信息!", "您还有没有登录，请先登录");
    }
  }

  deleteCartData() {
    List tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["checked"] == false) {
        tempList.add(cartList[i]);
      }
    }
    cartList.value = tempList;
    CartServers.setCartListData(tempList);
    computedAllPrice();
    update();
  }

  // 计算总价
  computedAllPrice() {
    double tempAllPrice = 0.0;
    int tempAllCount = 0;
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["checked"] == true) {
        tempAllPrice += (cartList[i]['price'] * cartList[i]['count']);
        tempAllCount += cartList[i]['count'] as int;
      }
    }
    allPrice.value = tempAllPrice;
    allCount.value = tempAllCount;
  }
}
