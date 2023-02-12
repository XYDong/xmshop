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

  // 轮播图
  Widget _focus() {
    return SizedBox(
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
    );
  }

  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        'assets/images/xiaomiBanner.png',
        fit: BoxFit.cover,
      ),
    );
  }

  // 顶部滑动分类
  Widget _category() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(480),
      child: Obx(() => Swiper(
            itemCount: controller.categoryList.length ~/ 10,
            itemBuilder: (context, index) {
              return GridView.builder(
                  itemCount: 10, // 总共多少数据
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, // 每行展示几个数据
                      // item的左右间距
                      crossAxisSpacing: ScreenAdapter.width(20),
                      mainAxisSpacing: ScreenAdapter.height(40)),
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ScreenAdapter.width(140),
                          height: ScreenAdapter.height(140),
                          child: Image.network(
                            'https://xiaomi.itying.com/${controller.categoryList[index * 10 + i].pic}'
                              ..replaceAll('\\', '/'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text(
                            '${controller.categoryList[index * 10 + i].title}',
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                          ),
                        ),
                      ],
                    );
                  });
            },
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints.expand(height: ScreenAdapter.height(20)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              activeColor: Colors.black54,
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })), // 底部指示器
            // control: const SwiperControl(), // 左右选择按钮（上一张、下一张）
          )),
    );
  }

  // banner2
  Widget _banner2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20),
          ScreenAdapter.height(20),
          ScreenAdapter.width(20),
          ScreenAdapter.height(0)),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/xiaomiBanner2.png',
                ))),
      ),
    );
  }

  // 热销甄选
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30),
              ScreenAdapter.height(40),
              ScreenAdapter.width(30),
              ScreenAdapter.height(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '热销臻选',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(46)),
              ),
              Text(
                '更多手机>',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(36),
                    color: Colors.black54),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30),
              ScreenAdapter.height(20),
              ScreenAdapter.width(30),
              ScreenAdapter.height(20)),
          child: Row(
            children: [
              // 左侧
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: Obx(() => Swiper(
                          itemCount: controller.bestSellingList.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              'https://xiaomi.itying.com/${controller.bestSellingList[index].pic}'
                                ..replaceAll('\\', '/'),
                              fit: BoxFit.fill,
                            );
                          },
                          pagination: SwiperPagination(
                              margin: const EdgeInsets.all(0.0),
                              builder: SwiperCustomPagination(builder:
                                  (BuildContext context,
                                      SwiperPluginConfig config) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints.expand(
                                      height: ScreenAdapter.height(36)),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child:
                                              const RectSwiperPaginationBuilder(
                                            color: Colors.black12,
                                            activeColor: Colors.black54,
                                          ).build(context, config),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })), // 底部指示器
                          // control: const SwiperControl(), // 左右选择按钮（上一张、下一张）
                          autoplay: true, //自动播放
                          loop: true, // 无限播放
                        )),
                  )),
              SizedBox(
                width: ScreenAdapter.width(10),
              ),
              // 右侧
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: ScreenAdapter.height(738),
                    // color: Colors.blue,
                    child: Obx(() => Column(
                          // 循环遍历map的另一种方式
                          children: controller.sellingList
                              .asMap()
                              .entries
                              .map((entries) {
                            var value = entries.value;
                            var key = entries.key;
                            return Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0,
                                    key < 2 ? ScreenAdapter.height(20) : 0),
                                color: const Color.fromRGBO(246, 246, 246, 1),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: ScreenAdapter.height(20)),
                                          Text('${value.title}',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          38),
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                              height: ScreenAdapter.height(20)),
                                          Text('${value.subTitle}',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          28))),
                                          SizedBox(
                                              height: ScreenAdapter.height(20)),
                                          Text('￥${value.price}元',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          34)))
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            ScreenAdapter.height(8)),
                                        child: Image.network(
                                            'https://xiaomi.itying.com/${value.pic}'
                                              ..replaceAll('\\', '/'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )),
                  )),
            ],
          ),
        ),
      ],
    );
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
          controller: controller.scrollController,
          children: [
            _focus(),
            _banner(),
            _category(),
            _banner2(),
            _bestSelling(),
            SizedBox(
              height: 100,
            )
          ],
        ));
  }
}
