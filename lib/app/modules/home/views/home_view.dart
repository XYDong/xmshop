import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/keepAliveWrapper.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('222222222'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('333333333333'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
            ListTile(
              title: Text('1111111111'),
            ),
          ],
        ),
      ),
    );
  }
}
