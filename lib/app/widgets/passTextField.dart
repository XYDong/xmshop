import 'package:flutter/material.dart';

import '../services/screenAdapter.dart';

class PassTextField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType inputType;
  final TextEditingController? controller;
  const PassTextField(
      {Key? key,
      required this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.inputType = TextInputType.text,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenAdapter.height(180),
      margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
      // padding: EdgeInsets.all(ScreenAdapter.width(40)),
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(40), 0, ScreenAdapter.width(40), 0),
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(ScreenAdapter.width(40))),
      child: TextField(
        // autofocus: true, // 默认获取焦点，并且弹出键盘
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(fontSize: ScreenAdapter.fontSize(48)),
        keyboardType: inputType,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
        onChanged: onChanged,
      ),
    );
  }
}
