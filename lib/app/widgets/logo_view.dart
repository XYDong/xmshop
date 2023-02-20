import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/screenAdapter.dart';

/// logo 抽离
class LogoView extends GetView {
  const LogoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(ScreenAdapter.width(80)),
      child: SizedBox(
        width: ScreenAdapter.width(180),
        height: ScreenAdapter.width(180),
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
