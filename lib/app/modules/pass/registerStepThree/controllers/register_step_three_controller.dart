import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../../services/storage.dart';

class RegisterStepThreeController extends GetxController {
  TextEditingController pwdEditingController1 = TextEditingController();
  TextEditingController pwdEditingController2 = TextEditingController();
  HttpsClient httpsClient = HttpsClient();
  String tel = Get.arguments["tel"];
  String code = Get.arguments["code"];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<MessageModel> doRegister() async {
    if (pwdEditingController1.text.isEmpty ||
        pwdEditingController2.text.isEmpty) {
      return MessageModel(message: '密码不能为空', success: false);
    }
    if (pwdEditingController1.text != pwdEditingController2.text) {
      return MessageModel(message: '两次密码输入不一致', success: false);
    }
    if (pwdEditingController1.text.length < 6 ||
        pwdEditingController2.text.length < 6) {
      return MessageModel(message: '密码长度不能小于6', success: false);
    }

    var response = await httpsClient.post("api/register", data: {
      "tel": tel,
      'password': pwdEditingController1.text,
      "code": code
    });
    if (response != null) {
      print(response);
      if (response.data["success"]) {
        // 保存用户信息
        Storage.setData('userinfo', response.data["userinfo"]);
        return MessageModel(message: '注册成功', success: true);
      } else {
        return MessageModel(
            message: '${response.data["message"]}', success: false);
      }
    } else {
      return MessageModel(message: '网络异常请重试', success: false);
    }
  }
}
