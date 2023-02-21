import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../../models/message.dart';
import '../../../../services/storage.dart';

class CodeLoginStepTwoController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  final TextEditingController editingController = TextEditingController();
  String tel = Get.arguments['tel'];

  RxInt seconds = 10.obs;

  @override
  void onInit() {
    super.onInit();
    countDown();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<MessageModel> validateLoginCode() async {
    print('tel:${editingController.text}');
    // 验证手机号合法性
    var response = await httpsClient.post('api/validateLoginCode',
        data: {'tel': tel, 'code': editingController.text});
    if (response != null) {
      print(response);
      if (response.data["success"]) {
        // 保存用户信息
        Storage.setData('userinfo', response.data["userinfo"]);
        return MessageModel(message: '验证码登录成功', success: true);
      } else {
        return MessageModel(
            message: '${response.data["message"]}', success: false);
      }
    } else {
      return MessageModel(message: '网络异常请重试', success: false);
    }
  }

  void countDown() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;
      if (seconds.value == 0) {
        timer.cancel();
      }
      update();
    });
  }

  void sendCode() async {
    print('tel:$tel');
    // 验证手机号合法性
    if (!GetUtils.isPhoneNumber(tel)) {
      Get.snackbar("提示信息!", '手机号码格式不正确');
    }
    if (tel.length < 11) {
      Get.snackbar("提示信息!", '手机号码长度小于11');
    }
    var response =
        await httpsClient.post('api/sendLoginCode', data: {'tel': tel});
    print(response);
    if (response != null) {
      //测试：把验证码复制到剪切板上面，正式上线不需要这句话,这个为了方便测试
      Clipboard.setData(ClipboardData(text: response.data["code"]));
      seconds.value = 10;
      countDown();
      update();
    } else {
      Get.snackbar("提示信息!", response.data["message"]);
    }
  }
}
