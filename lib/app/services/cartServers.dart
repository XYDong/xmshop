import 'package:xmshop/app/services/storage.dart';

import '../models/pcontent_model.dart';

class CartServers {
  // 增加购物车
  static addCart(ContentModel pcontent, String selectedAttr, int buyNum) async {
    /*
        1、获取本地存储的cartList数据
        2、判断cartList是否有数据
              有数据：
                  1、判断购物车有没有当前数据：
                          有当前数据：
                              1、让购物车中的当前数据数量 等于以前的 数量+现在的数量
                              2、重新写入本地存储

                          没有当前数据：
                              1、把购物车cartList的数据和当前数据拼接，拼接后重新写入本地存储。

              没有数据：
                  1、把当前商品数据以及属性数据放在数组中然后写入本地存储


                List list=[
                  {"_id": "1",
                    "title": "磨砂牛皮男休闲鞋-有属性",
                    "price": 688,
                    "selectedAttr": "牛皮 ,系带,黄色",
                    "count": 4,
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  },
                    {"_id": "2",
                    "title": "磨xxxxxxxxxxxxx",
                    "price": 688,
                    "selectedAttr": "牛皮 ,系带,黄色",
                    "count": 2,
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  }

                ];

      */
    List? cartListData = await Storage.getData('cartList');
    if (cartListData != null) {
      var hasData = cartListData.any((v) {
        return v["_id"] == pcontent.sId && v["selectedAttr"] == selectedAttr;
      });
      if (hasData) {
        for (var i = 0; i < cartListData.length; i++) {
          if (cartListData[i]["_id"] == pcontent.sId &&
              cartListData[i]["selectedAttr"] == selectedAttr) {
            cartListData[i]["count"] += buyNum;
          }
        }
        await Storage.setData("cartList", cartListData);
      } else {
        cartListData.add({
          "_id": pcontent.sId,
          "title": pcontent.title,
          "price": pcontent.price,
          "selectedAttr": selectedAttr,
          "count": buyNum,
          "pic": pcontent.pic,
          "checked": true
        });
        await Storage.setData("cartList", cartListData);
      }
    } else {
      List tempList = [];
      tempList.add({
        "_id": pcontent.sId,
        "title": pcontent.title,
        "price": pcontent.price,
        "selectedAttr": selectedAttr,
        "count": buyNum,
        "pic": pcontent.pic,
        "checked": true
      });
      await Storage.setData("cartList", tempList);
    }
  }

  //获取购物车数据
  static getCartData() async {
    List? cartListData = await Storage.getData('cartList');
    if (cartListData != null) {
      return cartListData;
    } else {
      return [];
    }
  }

  //修改购物车数据
  static setCartListData(cartList) async {
    await Storage.setData('cartList', cartList);
  }

  // 获取选中的CartList数据
  static getCheckedCartData() async {
    List tempList = [];
    List? cartListData = await Storage.getData("cartList");
    if (cartListData != null) {
      for (var i = 0; i < cartListData.length; i++) {
        if (cartListData[i]["checked"] == true) {
          tempList.add(cartListData[i]);
        }
      }
      return cartListData;
    } else {
      return [];
    }
  }

  // 删除购物车数据
  static deleteCartData(keyWords) async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData!.any((element) => element == keyWords)) {
      searchListData.remove(keyWords);
      await Storage.setData('searchList', searchListData);
    }
  }

  // 清空购物车
  static clearHistoryData() async {
    await Storage.clear('cartList');
  }
}
