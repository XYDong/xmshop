import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';

import '../../../services/screenAdapter.dart';

class CartItemNumView extends GetView {
  @override
  final CartController controller = Get.find();
  Map cartItem;

  CartItemNumView(this.cartItem, {Key? key}) : super(key: key);
  Widget _left() {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(64),
        child: const Text(
          "-",
        ),
      ),
      onTap: () {
        controller.changeSelectNum(cartItem, -1);
      },
    );
  }

  Widget _center() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        left: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
        right: BorderSide(width: ScreenAdapter.width(2), color: Colors.black12),
      )),
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(64),
      child: Text("${cartItem['count']}"),
    );
  }

  Widget _right() {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(64),
        child: const Text("+"),
      ),
      onTap: () {
        controller.changeSelectNum(cartItem, 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(80),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(width: ScreenAdapter.width(2), color: Colors.black12)),
      child: Row(
        children: [_left(), _center(), _right()],
      ),
    );
  }
}
