import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../../../widgets/passButton.dart';
import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('去支付'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        children: [
          Obx(() => ListView.builder(
              itemCount: controller.payList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        controller.changePayList(index);
                      },
                      leading:
                          Image.network(controller.payList[index]["image"]),
                      title: Text("${controller.payList[index]["title"]}"),
                      trailing: controller.payList[index]["chekced"]
                          ? const Icon(Icons.check)
                          : const Text(""),
                    ),
                    const Divider()
                  ],
                );
              })),
          SizedBox(
            height: ScreenAdapter.height(200),
          ),
          PassButton(
              btnStr: "支付",
              onPress: () {
                // print("支付");
                if (controller.payType == 0) {
                  print("支付宝支付");
                } else {
                  print("微信支付");
                }
              })
        ],
      ),
    );
  }
}
