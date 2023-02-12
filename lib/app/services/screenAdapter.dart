import 'package:flutter_screenutil/flutter_screenutil.dart';

// screenutil 封装
class ScreenAdapter {
  static width(num v) {
    return v.w;
  }

  static height(num v) {
    return v.h;
  }

  static fontSize(num v) {
    return v.sp;
  }

  // 屏幕宽度
  static getScreenWidth() {
    return 1.sw;
  }

  static getScreenHeight() {
    return 1.sh;
  }

  static getStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }
}
