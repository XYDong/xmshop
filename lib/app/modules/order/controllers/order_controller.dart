import 'package:get/get.dart';

import '../../../models/order_model.dart';
import '../../../models/user_model.dart';
import '../../../services/httpsClient.dart';
import '../../../services/signServices.dart';
import '../../../services/userServices.dart';

class OrderController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  RxList<OrderInfoModel> orderList = <OrderInfoModel>[].obs;
  @override
  void onInit() {
    getOrderList();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getOrderList() async {
    List userList = await UserServices.getUserInfo();
    UserModel userInfo = UserModel.fromJson(userList[0]);

    Map tempJson = {"uid": userInfo.sId};
    String sign = SignServices.getSign({
      ...tempJson,
      "salt": userInfo.salt //私钥
    });

    var response =
        await httpsClient.get("/api/orderList?uid=${userInfo.sId}&sign=$sign");
    print(response.data);

    if (response != null) {
      OrderModel tempList = OrderModel.fromJson(response.data);

      orderList.value = tempList.result!;
      update();
    }
  }
}
