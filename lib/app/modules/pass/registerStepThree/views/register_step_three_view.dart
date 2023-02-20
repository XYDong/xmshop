import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/widgets/logo_view.dart';
import 'package:xmshop/app/widgets/passTextField.dart';

import '../../../../services/screenAdapter.dart';
import '../../../../widgets/passButton.dart';
import '../controllers/register_step_three_controller.dart';

class RegisterStepThreeView extends GetView<RegisterStepThreeController> {
  const RegisterStepThreeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("手机号快速注册"),
        actions: [TextButton(onPressed: () {}, child: Text("帮助"))],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const LogoView(),
          //输入手机号
          PassTextField(
              obscureText: true,
              hintText: "请输入密码",
              inputType: TextInputType.text,
              onChanged: (value) {
                print(value);
              }),

          PassTextField(
              obscureText: true,
              inputType: TextInputType.text,
              hintText: "请输入确认密码",
              onChanged: (value) {
                print(value);
              }),

          SizedBox(height: ScreenAdapter.height(20)),
          PassButton(
              btnStr: "完成注册",
              onPress: () {
                print("完成注册");
              }),
        ],
      ),
    );
  }
}
