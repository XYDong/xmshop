import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: const Center(
        child: Text(
          'GiveView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
