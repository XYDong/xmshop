import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/widgets/logo_view.dart';
import 'package:xmshop/app/widgets/passTextField.dart';

import '../../../../models/message.dart';
import '../../../../services/screenAdapter.dart';
import '../../../../widgets/passButton.dart';
import '../../../../widgets/userAgreement.dart';
import '../controllers/pass_login_controller.dart';

class PassLoginView extends GetView<PassLoginController> {
  const PassLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [TextButton(onPressed: () {}, child: Text("帮助"))],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const LogoView(),
          //输入手机号
          PassTextField(
              controller: controller.telController,
              hintText: "请输入手机号",
              onChanged: (value) {
                print(value);
              }),

          PassTextField(
              controller: controller.passController,
              hintText: "请输入密码",
              onChanged: (value) {
                print(value);
              }),
          //用户协议
          const UserAgreement(),
          //登录按钮
          PassButton(
              btnStr: "登录",
              onPress: () async {
                // print("获取验证码");
                if (!GetUtils.isPhoneNumber(controller.telController.text) ||
                    controller.telController.text.length != 11) {
                  Get.snackbar("提示信息!", "手机号格式不合法");
                } else if (controller.passController.text.length < 6) {
                  Get.snackbar("提示信息!", "密码长度不能小于6位");
                } else {
                  MessageModel result = await controller.doLogin();
                  if (result.success) {
                    //执行跳转  回到根
                    Get.offAllNamed("/tabs", arguments: {
                      "initialPage": 4 //注册完成后会加载tabs第五个页面
                    });
                  } else {
                    Get.snackbar("提示信息!", result.message);
                  }
                }
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: Text("忘记密码")),
              TextButton(onPressed: () {}, child: Text("验证码登录"))
            ],
          )
        ],
      ),
    );
  }
}
