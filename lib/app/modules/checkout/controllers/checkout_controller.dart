import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../models/address_model.dart';
import '../../../models/user_model.dart';
import '../../../services/signServices.dart';
import '../../../services/storage.dart';
import '../../../services/userServices.dart';

class CheckoutController extends GetxController {
  RxList checkOutList = [].obs;
  HttpsClient httpsClient = HttpsClient();
  RxList<AddressItemModel> addressList = <AddressItemModel>[].obs;
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
}
