import 'package:get/get.dart';

class PayController extends GetxController {
  RxList payList = [
    {
      "id": 1,
      "title": "支付宝支付",
      "chekced": true,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 2,
      "title": "微信支付",
      "chekced": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ].obs;

  int payType = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changePayList(index) {
    List<Map<String, Object>> tempList = [];
    for (var i = 0; i < payList.length; i++) {
      payList[i]["chekced"] = false;
      tempList.add(payList[i]);
    }
    tempList[index]["chekced"] = true;
    payType = index;
    payList.value = tempList;
    update();
  }
}
