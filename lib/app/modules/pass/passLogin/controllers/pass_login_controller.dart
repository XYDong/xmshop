import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/message.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../../services/storage.dart';

class PassLoginController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  TextEditingController telController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<MessageModel> doLogin() async {
    if (telController.text.isEmpty) {
      return MessageModel(message: '用户名不能为空', success: false);
    }
    if (passController.text.isEmpty) {
      return MessageModel(message: '密码不能为空', success: false);
    }

    var response = await httpsClient.post("api/doLogin", data: {
      "username": telController.text,
      'password': passController.text,
    });
    if (response != null) {
      print(response);
      if (response.data["success"]) {
        // 保存用户信息
        Storage.setData('userinfo', response.data["userinfo"]);
        return MessageModel(message: '登录成功', success: true);
      } else {
        return MessageModel(
            message: '${response.data["message"]}', success: false);
      }
    } else {
      return MessageModel(message: '网络异常请重试', success: false);
    }
  }
}
