import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/JokerIcons.dart';
import 'package:xmshop/app/services/keepAliveWrapper.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print('屏幕宽度:${ScreenAdapter.getScreenWidth()}');
    // print('屏幕高度:${ScreenAdapter.getScreenHeight()}');
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            _homePage(),
            _appBar(),
          ],
        ),
      ),
    );
  }

  // 顶部导航
  Widget _appBar() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Obx(() => AppBar(
              leading: controller.flag.value
                  ? const Text('')
                  : const Icon(
                      JokerIcons.xiaomi,
                      color: Colors.white,
                    ),
              leadingWidth: controller.flag.value
                  ? ScreenAdapter.width(40)
                  : ScreenAdapter.width(140),
              title: AnimatedContainer(
                width: controller.flag.value
                    ? ScreenAdapter.width(800)
                    : ScreenAdapter.width(620),
                height: ScreenAdapter.height(96),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(230, 252, 243, 236),
                    borderRadius: BorderRadius.circular(30)),
                duration: const Duration(milliseconds: 300),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0,
                          ScreenAdapter.width(10), 0),
                      child: const Icon(Icons.search),
                    ),
                    Text(
                      '手机',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: ScreenAdapter.fontSize(32)),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              backgroundColor: controller.flag.value
                  ? Colors.white
                  : Colors.transparent, // 透明状态栏
              elevation: 0, // 透明度
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code,
                      color:
                          controller.flag.value ? Colors.black87 : Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color:
                          controller.flag.value ? Colors.black87 : Colors.white,
                    )),
              ],
            )));
  }

  // 内容区域
  Widget _homePage() {
    return Positioned(
        top: -(ScreenAdapter.getStatusBarHeight()),
        left: 0,
        right: 0,
        bottom: 0,
        // https://www.itying.com/images/focus/focus02.png
        child: ListView(
          children: [
            Container(
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(682),
              child: Obx(() => Swiper(
                    itemCount: controller.swiperList.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        'https://xiaomi.itying.com/${controller.swiperList[index].pic}'
                          ..replaceAll("\\", "/"),
                        fit: BoxFit.fill,
                      );
                    },
                    pagination: const SwiperPagination(
                        // SwiperPagination.rect 指示器样式
                        builder: SwiperPagination.rect), // 底部指示器
                    // control: const SwiperControl(), // 左右选择按钮（上一张、下一张）
                    autoplay: true, //自动播放
                    loop: true, // 无限播放
                  )),
            )
          ],
        ));
  }
}
