import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // body内容从状态栏开始，而不是从appbar 开始 实现透明导航
      // appBar 不能直接加obx, 需要使用PreferredSize 包装一下
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenAdapter.width(96)),
          child: Obx(() => AppBar(
                leading: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        // shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                ),
                title: SizedBox(
                  width: ScreenAdapter.width(400),
                  height: ScreenAdapter.height(96),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '商品',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42)),
                            ),
                            Container(
                              width: ScreenAdapter.width(70),
                              height: ScreenAdapter.width(4),
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '详情',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42)),
                            ),
                            Container(
                              width: ScreenAdapter.width(70),
                              height: ScreenAdapter.width(4),
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '推荐',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42)),
                            ),
                            Container(
                              width: ScreenAdapter.width(70),
                              height: ScreenAdapter.width(4),
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.white.withOpacity(controller
                    .opacity.value), // 透明状态栏  withOpacity 可以改变透明度 实现透明导航
                elevation: 0, // 阴影 实现透明导航
                actions: [
                  Container(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        // shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      child: const Icon(
                        Icons.file_upload_outlined,
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenAdapter.width(88),
                    height: ScreenAdapter.width(88),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        // ElevatedButton 里边的ButtonStyle 有默认的padding 需要设置为0 ，alignment 才会生效
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        // shadowColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                      ),
                      child: const Icon(
                        Icons.more_horiz_rounded,
                      ),
                    ),
                  ),
                ],
              ))),
      body: ListView(
        controller: controller.scrollController,
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(300),
            color: Colors.orange,
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
          const ListTile(
            title: Text('111111111111'),
          ),
        ],
      ),
    );
  }
}
