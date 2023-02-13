import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(910),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _productListWidget(),
          _subHeaderWidget(),
        ],
      ),
    );
  }

  // 顶部菜单
  Widget _subHeaderWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(233, 233, 233, 0.9)))),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text(
                    "综合",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: ScreenAdapter.fontSize(32)),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("销量",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("价格",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("筛选",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {
                  //注意：新版本中ScaffoldState? 为可空类型 注意判断
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 商品列表
  Widget _productListWidget() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(26),
            ScreenAdapter.height(140),
            ScreenAdapter.width(26),
            ScreenAdapter.height(26)),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                // 左侧
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(10)),
                  width: ScreenAdapter.width(400),
                  height: ScreenAdapter.height(460),
                  child: Image.network(
                    'https://www.itying.com/images/focus/focus02.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                // 右侧
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, ScreenAdapter.height(20)),
                        child: Text(
                          '手机',
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(42),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 0, 0, ScreenAdapter.height(20)),
                        child: Text(
                          '11111111111111111111111111',
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, 0, ScreenAdapter.height(20)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    'CPU',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '11111111',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34)),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    'CPU',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '11111111',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34)),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    'CPU',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '11111111',
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34)),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '￥20000元',
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(34),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
