import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/services/userServices.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  Widget _checkoutItem() {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenAdapter.height(20),
          bottom: ScreenAdapter.height(20),
          right: ScreenAdapter.height(20)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: ScreenAdapter.width(200),
            height: ScreenAdapter.width(200),
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: Image.network("https://www.itying.com/images/shouji.png",
                fit: BoxFit.fitHeight),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "小米5A",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ScreenAdapter.height(10)),
              const Text("白色 128GB"),
              SizedBox(height: ScreenAdapter.height(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("￥121", style: TextStyle(color: Colors.red)),
                  Text("x2", style: TextStyle(color: Colors.black87))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _body() {
    return ListView(
      padding: EdgeInsets.all(ScreenAdapter.width(40)),
      children: [
        Container(
          padding: EdgeInsets.only(
              top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: const ListTile(
            leading: Icon(Icons.add_location),
            title: Text("增加收货地址"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
          padding: EdgeInsets.only(
              top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("张三 15201681234"),
                SizedBox(
                  height: ScreenAdapter.height(10),
                ),
                Text("北京市海淀区西二旗"),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
          padding: EdgeInsets.only(
              top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: Column(
            children: [
              _checkoutItem(),
              _checkoutItem(),
              _checkoutItem(),
              _checkoutItem(),
              _checkoutItem()
            ],
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
          padding: EdgeInsets.only(
              top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: Column(
            children: [
              ListTile(
                  title: const Text("运费"),
                  trailing: Wrap(
                    children: [Text("包邮")],
                  )),
              ListTile(
                title: const Text("优惠券"),
                trailing: Wrap(
                  children: const [Text("无可用"), Icon(Icons.navigate_next)],
                ),
              ),
              ListTile(
                title: const Text("卡券"),
                trailing: Wrap(
                  children: const [Text("无可用"), Icon(Icons.navigate_next)],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
          padding: EdgeInsets.only(
              top: ScreenAdapter.height(20), bottom: ScreenAdapter.height(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: const ListTile(
            title: Text("发票"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
      ],
    );
  }

  Widget _bottom() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.only(right: ScreenAdapter.width(20)),
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(190),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: const Color.fromARGB(178, 240, 236, 236),
                      width: ScreenAdapter.height(2))),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: ScreenAdapter.width(20)),
                  const Text("共1件,合计:"),
                  Text("¥699",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(58),
                          color: Colors.red)),
                  SizedBox(width: ScreenAdapter.width(20)),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(251, 72, 5, 0.9)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          // CircleBorder()
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () async {
                    // //判断用户有没有登录
                    if (await UserServices.getUserLoginState()) {
                      Get.toNamed("/checkout");
                    } else {
                      Get.offAndToNamed('/code-login-step-view');
                    }
                  },
                  child: const Text("去付款"))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: const Text('确认订单'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [_body(), _bottom()],
      ),
    );
  }
}
