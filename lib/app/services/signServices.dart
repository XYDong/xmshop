import 'dart:convert';

import 'package:crypto/crypto.dart';

class SignServices {
  // static getSign(Map addressJson) {
  //   // Map addressJson = {
  //   //   "aid": 1,
  //   //   "name": 'zhangsan',
  //   //   "age": 20,
  //   //   "sex": '男',
  //   //   "salt":"xxxewrewqrqrwqrwqrwqr"  //私钥
  //   // };
  //   List jsonKeys = addressJson.keys.toList();
  //   //按照 ASCII 字符顺序进行升序排列（也就是所谓的自然顺序）
  //   jsonKeys.sort();
  //
  //   String str = '';
  //   for (var i = 0; i < jsonKeys.length; i++) {
  //     str += "${jsonKeys[i]}${addressJson[jsonKeys[i]]}";
  //   }
  //
  //   print(str); //age20aid1namezhangsansaltxxxewrewqrqrwqrwqrwqrsex男
  //
  //   var sign = md5.convert(utf8.encode(str));
  //
  //   print("$sign");
  // }

  static String getSign(Map json) {
    List jsonKeys = json.keys.toList();

    jsonKeys.sort();

    String str = '';
    for (var i = 0; i < jsonKeys.length; i++) {
      str += "${jsonKeys[i]}${json[jsonKeys[i]]}";
    }
    var sign = md5.convert(utf8.encode(str));
    return "$sign";
  }
}
