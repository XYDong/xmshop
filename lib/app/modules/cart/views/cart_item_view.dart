import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/services/httpsClient.dart';

import '../../../services/screenAdapter.dart';
import 'cart_item_num_view.dart';

class CartItemView extends GetView {
  @override
  final CartController controller = Get.find();
  Map cartItem;
  CartItemView(this.cartItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.height(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
                color: const Color.fromARGB(178, 240, 236, 236),
                width: ScreenAdapter.height(2))),
      ),
      child: Row(
        children: [
          SizedBox(
            width: ScreenAdapter.width(100),
            child: Checkbox(
                activeColor: Colors.red,
                value: cartItem['checked'],
                onChanged: (value) {
                  controller.checkCartItem(cartItem);
                }),
          ),
          Container(
            width: ScreenAdapter.width(260),
            padding: EdgeInsets.all(ScreenAdapter.height(24)),
            margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
            child: Image.network(HttpsClient.replaceUri(cartItem['pic']),
                fit: BoxFit.fitHeight),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${cartItem['title']}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(36),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: ScreenAdapter.height(20)),
              Row(
                children: [Chip(label: Text("${cartItem['selectedAttr']}"))],
              ),
              SizedBox(height: ScreenAdapter.height(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("¥${cartItem['price']}",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(38),
                          color: Colors.red)),
                  CartItemNumView(cartItem)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
