import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  // ScreenUtilInit 屏幕适配
  runApp(ScreenUtilInit(
    designSize: const Size(1080, 2400), //设计稿的宽高
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // 配置主题
        theme: ThemeData(primarySwatch: Colors.grey),
        // 配置ios动画
        defaultTransition: Transition.rightToLeft,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,

        // 配置国际化
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CH'),
          Locale('en', 'US'),
        ],
      );
    },
  ));
}
