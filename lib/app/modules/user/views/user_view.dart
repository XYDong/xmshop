import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/widgets/passButton.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('用户中心'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('会员码'),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.qr_code_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.message_outlined))
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          padding: EdgeInsets.all(ScreenAdapter.height(20)),
          children: [
            // 用户头像 登录注册
            Obx(() => controller.isLogin.value
                ? Container(
                    margin: EdgeInsets.all(ScreenAdapter.width(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenAdapter.width(150),
                          height: ScreenAdapter.height(150),
                          child: CircleAvatar(
                            radius: ScreenAdapter.width(75),
                            backgroundImage:
                                // const AssetImage('assets/images/user.png'),
                                const AssetImage('assets/images/user.png'),
                          ),
                        ),
                        SizedBox(
                          width: ScreenAdapter.width(40),
                        ),
                        InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${controller.userInfo.value.username}',
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(46)),
                                ),
                                SizedBox(
                                  height: ScreenAdapter.height(10),
                                ),
                                Text(
                                  '普通会员',
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(46)),
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.toNamed('/code-login-step-one');
                            }),
                        SizedBox(
                          width: ScreenAdapter.width(40),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenAdapter.fontSize(34),
                          color: Colors.black54,
                        )
                      ],
                    ),
                  )
                : Container(
                    margin: EdgeInsets.all(ScreenAdapter.width(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: ScreenAdapter.width(150),
                          height: ScreenAdapter.height(150),
                          child: CircleAvatar(
                            radius: ScreenAdapter.width(75),
                            backgroundImage:
                                const AssetImage('assets/images/user.png'),
                          ),
                        ),
                        SizedBox(
                          width: ScreenAdapter.width(40),
                        ),
                        InkWell(
                            child: Text(
                              '登录/注册',
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(46)),
                            ),
                            onTap: () {
                              Get.toNamed('/code-login-step-one');
                            }),
                        SizedBox(
                          width: ScreenAdapter.width(40),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: ScreenAdapter.fontSize(34),
                          color: Colors.black54,
                        )
                      ],
                    ),
                  )),
            // 钱包
            Container(
              height: ScreenAdapter.height(200),
              margin: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
                  ScreenAdapter.height(50), ScreenAdapter.height(20), 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(80),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: ScreenAdapter.height(10),
                        ),
                        const Text(
                          '米金',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(80),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: ScreenAdapter.height(10),
                        ),
                        const Text(
                          '米金',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(80),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: ScreenAdapter.height(10),
                        ),
                        const Text(
                          '米金',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '-',
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(80),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: ScreenAdapter.height(10),
                        ),
                        const Text(
                          '米金',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.bookmarks_outlined),
                        SizedBox(
                          height: ScreenAdapter.height(10),
                        ),
                        const Text(
                          '米金',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 广告1
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
              child: Container(
                width: ScreenAdapter.width(1008),
                height: ScreenAdapter.height(350),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/user_ad1.png'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            // 订单
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
              padding: EdgeInsets.all(ScreenAdapter.width(20)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('收藏'),
                            Text(
                              '0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 1, color: Colors.black12),
                                  right: BorderSide(
                                      width: 1, color: Colors.black12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('足迹'),
                              Text(
                                '0',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('关注'),
                            Text(
                              '0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, ScreenAdapter.height(30), 0,
                        ScreenAdapter.height(30)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.payment_outlined),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                '待付款',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.payment_outlined),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                '待收货',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.payment_outlined),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                '待评价',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.payment_outlined),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                '退换/售后',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.bookmarks_outlined),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                '全部订单',
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            //服务
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(20),
                  ScreenAdapter.width(20),
                  ScreenAdapter.width(20),
                  ScreenAdapter.width(20)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '服务',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text('查看更多'),
                          const Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenAdapter.height(40),
                  ),
                  MasonryGridView.count(
                      crossAxisCount: 4,
                      itemCount: 8,
                      shrinkWrap: true, // 收缩，让子元素自适应
                      physics: const NeverScrollableScrollPhysics(), // 禁止滑动
                      mainAxisSpacing: ScreenAdapter.width(50), // 水平方向间距
                      crossAxisSpacing: ScreenAdapter.height(50), // 垂直方向间距
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Icon(controller.userServices[index]['icon']),
                              SizedBox(
                                height: ScreenAdapter.height(20),
                              ),
                              Text(
                                  '${controller.userServices[index]['title']}'),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
            //广告
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
              child: Container(
                width: ScreenAdapter.width(1008),
                height: ScreenAdapter.height(300),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/user_ad2.png"),
                        fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.circular(ScreenAdapter.width(20))),
              ),
            ),

            PassButton(
              btnStr: '退出登录',
              onPress: () {
                controller.loginOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
