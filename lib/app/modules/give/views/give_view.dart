import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/give_controller.dart';

class GiveView extends GetView<GiveController> {
  const GiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('服务'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  controller.checkAuth();
                },
                child: const Text('检测生物识别'),
              ),
              SizedBox(
                height: ScreenAdapter.height(20),
              ),
              ElevatedButton(
                onPressed: () async {
                  controller.getAuthList();
                },
                child: const Text('获取生物识别技术列表'),
              ),
              SizedBox(
                height: ScreenAdapter.height(20),
              ),
              ElevatedButton(
                onPressed: () async {
                  controller.didAuth();
                },
                child: const Text('指纹认证'),
              ),
              SizedBox(
                height: ScreenAdapter.height(20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
