import 'dart:convert';

import 'package:get/get.dart';
import 'package:xmshop/app/services/cartServers.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../services/signServices.dart';
import '../../../services/storage.dart';
import '../../../services/userServices.dart';
import '../../cart/controllers/cart_controller.dart';

class CheckoutController extends GetxController {
  RxList checkOutList = [].obs;
  HttpsClient httpsClient = HttpsClient();
  CartController cartController = Get.find<CartController>();
  RxList<AddressItemModel> addressList = <AddressItemModel>[].obs;

  // 商品总价
  RxDouble allPrice = 0.0.obs;
  // 商品总数
  RxInt allCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCheckOutData();
    getDefaultAddress();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCheckOutData() async {
    List? tempList = await Storage.getData('checkoutList');
    if (tempList!.isNotEmpty) {
      checkOutList.value = tempList;
      computedAllPrice();
      update();
    }
  }

  getDefaultAddress() async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);

    Map tempJson = {"uid": userInfo.sId};
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });
    var response = await httpsClient
        .get("api/oneAddressList?uid=${userInfo.sId}&sign=$sign");
    print(response);

    if (response != null) {
      var tempAddressList = AddressModel.fromJson(response.data);
      addressList.value = tempAddressList.result!;
      update();
    }
  }

  // 计算总价
  computedAllPrice() {
    double tempAllPrice = 0.0;
    int tempAllCount = 0;
    for (var i = 0; i < checkOutList.length; i++) {
      if (checkOutList[i]["checked"] == true) {
        tempAllPrice += (checkOutList[i]['price'] * checkOutList[i]['count']);
        tempAllCount += checkOutList[i]['count'] as int;
      }
    }
    allPrice.value = tempAllPrice;
    allCount.value = tempAllCount;
  }

  //去结算
  doCheckOut() async {
    if (addressList.isNotEmpty) {
      List userList = await UserServices.getUserInfo();
      UserModel userInfo = UserModel.fromJson(userList[0]);

      Map tempJson = {
        "uid": userInfo.sId,
        "phone": addressList[0].phone,
        "address": addressList[0].address,
        "name": addressList[0].name,
        "all_price": allPrice.value.toStringAsFixed(1), //注意：保留 1 位小数
        "products": json.encode(checkOutList), //需要传入json字符串
      };

      String sign = SignServices.getSign({
        ...tempJson,
        "salt": userInfo.salt //私钥
      });
      var response = await httpsClient
          .post("api/doOrder", data: {...tempJson, "sign": sign});
      print(response.data);
      if (response.data["success"]) {
        //删除购物车中选中的商品
        await CartServers.deleteCheckOutData(checkOutList);
        //更新购物车数据
        cartController.getCartListData();

        Get.toNamed("/pay");
      } else {
        Get.snackbar("提示信息", response.data["message"]);
      }
    } else {
      Get.snackbar("提示信息", "请选择收货地址");
    }
  }
}
