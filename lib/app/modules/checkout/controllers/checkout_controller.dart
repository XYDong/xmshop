import 'package:get/get.dart';
import 'package:xmshop/app/services/storage.dart';

class CheckoutController extends GetxController {
  RxList checkOutList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getCheckOutData();
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
}
