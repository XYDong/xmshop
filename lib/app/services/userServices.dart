import 'package:xmshop/app/services/storage.dart';

class UserServices {
  static Future<List> getUserInfo() async {
    List? userList = await Storage.getData('userinfo');
    if (userList != null) {
      return userList;
    } else {
      return [];
    }
  }

  static Future<bool> getUserLoginState() async {
    List userList = await getUserInfo();
    if (userList.isNotEmpty && userList[0]['username'] != '') {
      return true;
    } else {
      return false;
    }
  }

  static loginOut() {
    Storage.removeData('userinfo');
  }
}
