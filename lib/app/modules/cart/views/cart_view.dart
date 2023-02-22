import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/cart_controller.dart';
import 'cart_item_view.dart';

class CartView extends GetView {
  // 不是从tabs 跳转的时候，不能懒加载controller，因为懒加载的controller 会在页面销毁的时候全部清空
  @override
  CartController controller = Get.put(CartController());

  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('购物车'),
        centerTitle: true,
        actions: [
          Obx(() => controller.isEdit.value
              ? TextButton(
                  onPressed: () {
                    controller.changeIsEdit();
                  },
                  child: const Text(
                    "删除",
                    style: TextStyle(color: Colors.black87),
                  ))
              : TextButton(
                  onPressed: () {
                    controller.changeIsEdit();
                  },
                  child: const Text(
                    "编辑",
                    style: TextStyle(color: Colors.black87),
                  )))
        ],
      ),
      body: GetBuilder<CartController>(
        init: controller,
        builder: (builder) {
          return controller.cartList.isNotEmpty
              ? Stack(
                  children: [
                    Container(
                        margin:
                            EdgeInsets.only(bottom: ScreenAdapter.height(200)),
                        child: ListView(
                          children: controller.cartList
                              .map((element) => CartItemView(element))
                              .toList(),
                        )),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(right: ScreenAdapter.width(20)),
                          width: ScreenAdapter.width(1080),
                          height: ScreenAdapter.height(190),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: const Color.fromARGB(
                                          178, 240, 236, 236),
                                      width: ScreenAdapter.height(2))),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Checkbox(
                                      activeColor: Colors.red,
                                      value: controller.checkedAll.value,
                                      onChanged: (value) {
                                        controller.checkedAllCartItem(value);
                                      })),
                                  const Text("全选")
                                ],
                              ),
                              Row(
                                children: [
                                  Obx(() =>
                                      Text("共${controller.allCount}件  合计: ")),
                                  Obx(() => Text(
                                      "¥${controller.allPrice.value}",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(58),
                                          color: Colors.red))),
                                  SizedBox(width: ScreenAdapter.width(20)),
                                  Obx(() => controller.isEdit.value
                                      ? ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  const Color.fromRGBO(
                                                      227, 15, 15, 1.0)),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              shape: MaterialStateProperty.all(
                                                  // CircleBorder()
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                          onPressed: () async {
                                            //判断用户有没有登录
                                            controller.deleteCartData();
                                          },
                                          child: const Text("删除"))
                                      : ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  const Color.fromRGBO(255, 165, 0, 0.9)),
                                              foregroundColor: MaterialStateProperty.all(Colors.white),
                                              shape: MaterialStateProperty.all(
                                                  // CircleBorder()
                                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                                          onPressed: () async {
                                            //判断用户有没有登录
                                            controller.checkout();
                                          },
                                          child: const Text("结算")))
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                )
              : const Center(
                  child: Text('购物车空空的'),
                );
        },
      ),
    );
  }
}
