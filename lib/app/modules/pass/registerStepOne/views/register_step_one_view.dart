import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/screenAdapter.dart';
import '../../../../widgets/logo_view.dart';
import '../../../../widgets/passButton.dart';
import '../../../../widgets/passTextField.dart';
import '../controllers/register_step_one_controller.dart';

class RegisterStepOneView extends GetView<RegisterStepOneController> {
  const RegisterStepOneView({Key? key}) : super(key: key);
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
              controller: controller.telController,
            ),
            PassButton(
                btnStr: "下一步",
                onPress: () async {
                  if (GetUtils.isPhoneNumber(controller.telController.text) &&
                      controller.telController.text.length == 11) {
                    var flag = await controller.sendCode();
                    if (flag) {
                      Get.toNamed("/register-step-two",
                          arguments: {"tel": controller.telController.text});
                    } else {
                      Get.snackbar("提示信息!", "网络异常");
                    }
                  } else {
                    Get.snackbar("提示信息!", "手机号格式不合法");
                  }
                }),
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("遇到问题？您可以"),
                  TextButton(
                      onPressed: () {
                        print("获取帮助");
                      },
                      child: const Text("获取帮助"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
