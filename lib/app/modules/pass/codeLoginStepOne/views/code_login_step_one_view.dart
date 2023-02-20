import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/widgets/logo_view.dart';
import 'package:xmshop/app/widgets/passButton.dart';
import 'package:xmshop/app/widgets/passTextField.dart';
import 'package:xmshop/app/widgets/userAgreement.dart';

import '../controllers/code_login_step_one_controller.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('帮助'),
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(ScreenAdapter.width(40)),
          children: [
            const LogoView(),
            PassTextField(
                hintText: '请输入手机号码',
                onChanged: (value) {
                  print('请输入手机号码:$value');
                }),
            PassTextField(
                hintText: '请输入密码',
                onChanged: (value) {
                  print('请输入密码:$value');
                }),
            const UserAgreement(),
            PassButton(
              btnStr: '登录',
              onPress: () {
                print('登录');
                Get.toNamed("/code-login-step-two");
                // Get.toNamed('/code-login-step-two');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed("/register-step-one");
                    },
                    child: Text("新用户注册")),
                TextButton(
                    onPressed: () {
                      Get.toNamed("/pass-login");
                    },
                    child: Text("账户密码登录"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
