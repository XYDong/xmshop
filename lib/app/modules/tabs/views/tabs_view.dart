import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.setCurrentIndex(index);
              // controller.pageController.animateToPage(index,
              //     duration: const Duration(microseconds: 500),
              //     curve: Curves.linear);
              controller.pageController.jumpToPage(index);
            },
            // iconSize: 25, // 底部菜单大小
            fixedColor: Colors.red, // 底部菜单选中的颜色
            type: BottomNavigationBarType.fixed, // 如果有四个以上的菜单，需要配置该属性
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: '服务'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: '购物车'),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: '用户'),
            ],
          ),
        ));
  }
}
