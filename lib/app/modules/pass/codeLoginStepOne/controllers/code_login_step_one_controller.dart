import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class CodeLoginStepOneController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  TextEditingController telController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<MessageModel> sendCode() async {
    print('tel:${telController.text}');
    // 验证手机号合法性
    if (!GetUtils.isPhoneNumber(telController.text)) {
      return MessageModel(message: '手机号码格式不正确', success: false);
    }
    if (telController.text.length < 11) {
      return MessageModel(message: '手机号码长度小于11', success: false);
    }
    var response = await httpsClient
        .post('api/sendLoginCode', data: {'tel': telController.text});
    print(response);
    if (response != null) {
      //测试：把验证码复制到剪切板上面，正式上线不需要这句话,这个为了方便测试
      Clipboard.setData(ClipboardData(text: response.data["code"]));
      return MessageModel(message: '发送验证码成功', success: true);
    } else {
      return MessageModel(message: response.data["message"], success: false);
    }
  }
}
