import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/httpsClient.dart';
import '../../../services/screenAdapter.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: const Text('订单'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(() => controller.orderList.isNotEmpty
              ? ListView(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(20),
                      ScreenAdapter.height(140),
                      ScreenAdapter.width(20),
                      ScreenAdapter.width(20)),
                  children: controller.orderList.map((value) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.grey[200]!,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/order-info",
                              arguments: {"id": value.sId});
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("订单编号：${value.orderId}"),
                            ),
                            Column(
                                children: value.orderItem!.map((v) {
                              return ListTile(
                                leading: Container(
                                  alignment: Alignment.center,
                                  width: ScreenAdapter.width(120),
                                  height: ScreenAdapter.width(120),
                                  child: Image.network(
                                    HttpsClient.replaceUri(v.productImg),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                title: Text("${v.productTitle}"),
                                trailing: Text("x${v.productCount}"),
                              );
                            }).toList()),
                            ListTile(
                              leading: Wrap(children: [
                                const Text("合计:"),
                                Text(
                                  "￥${value.allPrice}",
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ]),
                              trailing: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.grey[200])),
                                child: const Text("申请售后"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList())
              : const Center(
                  child: Text("您还没有订单"),
                )),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                color: Colors.grey[50],
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.height(120),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text("全部", textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("待付款", textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("待收货", textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("已完成", textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: Text("已取消", textAlign: TextAlign.center),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
