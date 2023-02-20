import 'package:get/get.dart';

import '../../../services/JokerIcons.dart';

class UserController extends GetxController {
  List userServices = [
    {
      "_id": 1,
      "title": "一键安装",
      "icon": JokerIcons.anzhuang,
    },
    {
      "_id": 2,
      "title": "一键退换",
      "icon": JokerIcons.tuihuanhuo,
    },
    {
      "_id": 3,
      "title": "一键维修",
      "icon": JokerIcons.weixiu,
    },
    {
      "_id": 4,
      "title": "服务进度",
      "icon": JokerIcons.anzhuang,
    },
    {
      "_id": 5,
      "title": "小米之家",
      "icon": JokerIcons.duihuan,
    },
    {
      "_id": 6,
      "title": "客服中心",
      "icon": JokerIcons.kefu,
    },
    {
      "_id": 7,
      "title": "以旧换新",
      "icon": JokerIcons.anzhuangyewu,
    },
    {
      "_id": 8,
      "title": "手机电池",
      "icon": JokerIcons.schedule,
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
