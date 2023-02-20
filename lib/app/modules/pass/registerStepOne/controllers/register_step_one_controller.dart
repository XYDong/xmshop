import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../services/httpsClient.dart';

class RegisterStepOneController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  // 输入的手机号
  RxString phone = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> sendCode() async {
    print('tel:${phone.value}');
    // 验证手机号合法性
    if (GetUtils.isPhoneNumber(phone.value)) {
      var response =
          await httpsClient.post('api/sendCode', data: {'tel': phone.value});
      print(response);
      if (response != null) {
        //测试：把验证码复制到剪切板上面，正式上线不需要这句话,这个为了方便测试
        Clipboard.setData(ClipboardData(text: response.data["code"]));
        return response.data['success'];
      } else {
        return false;
      }
    } else {
      Get.snackbar('提示', '手机号格式不正确');
      return false;
    }
  }
}
