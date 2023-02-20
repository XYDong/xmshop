import 'package:flutter/material.dart';

import '../services/screenAdapter.dart';

class PassButton extends StatelessWidget {
  final String btnStr;
  final Function()? onPress;
  const PassButton({Key? key, required this.btnStr, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      height: ScreenAdapter.height(140),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenAdapter.width(70))))),
        onPressed: onPress,
        child: Text(
          btnStr,
          style: TextStyle(fontSize: ScreenAdapter.fontSize(46)),
        ),
      ),
    );
  }
}
