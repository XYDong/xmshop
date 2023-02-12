import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('TabsView'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'TabsView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex(index);
            },
            // iconSize: 25, // 底部菜单大小
            fixedColor: Colors.red, // 底部菜单选中的颜色
            type: BottomNavigationBarType.fixed, // 如果有四个以上的菜单，需要配置该属性
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: '用户'),
            ],
          ),
        ));
  }
}
