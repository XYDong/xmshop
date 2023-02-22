import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/screenAdapter.dart';
import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  const AddressListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('收获地址'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        child: Stack(
          children: [
            Obx(() => controller.addressList.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(bottom: ScreenAdapter.height(200)),
                    child: ListView(
                      children: controller.addressList
                          .map((element) => Column(
                                children: [
                                  ListTile(
                                    onLongPress: () {
                                      // 弹出选择框
                                      // 只能删除普通收获地址默认收货地址不能删除
                                      if (element.defaultAddress == 1) {
                                        Get.snackbar('提示', '不能删除默认收获地址');
                                      } else {
                                        Get.defaultDialog(
                                            title: '提示',
                                            middleText: '您确定要删除该条收获地址吗?',
                                            cancel: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shadowColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white)),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('取消'),
                                            ),
                                            confirm: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shadowColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white)),
                                              onPressed: () {
                                                controller
                                                    .deleteAddress(element.sId);
                                                Get.back();
                                              },
                                              child: const Text('确定'),
                                            ));
                                      }
                                    },
                                    onTap: () {
                                      // 选择收获地址
                                      controller
                                          .changeDefaultAddress(element.sId);
                                    },
                                    leading: element.defaultAddress == 1
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.red,
                                          )
                                        : null,
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${element.address}",
                                          style: const TextStyle(
                                              color: Colors.black54),
                                        ),
                                        SizedBox(
                                            height: ScreenAdapter.height(24)),
                                        Text(
                                            "${element.name}  ${element.phone}"),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      alignment: Alignment.center,
                                      icon: const Icon(Icons.edit),
                                      color: Colors.blue,
                                      onPressed: () {
                                        Get.toNamed('/address-edit',
                                            arguments: {
                                              'id': element.sId,
                                              'name': element.name,
                                              'phone': element.phone,
                                              'address': element.address
                                            });
                                      },
                                    ),
                                  ),
                                  const Divider(),
                                  SizedBox(height: ScreenAdapter.height(30)),
                                ],
                              ))
                          .toList(),
                    ),
                  )
                : const Center(
                    child: Text("请添加收货地址哦"),
                  )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/address-add");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 72, 5, 0.9),
                        borderRadius: BorderRadius.circular(20)),
                    height: ScreenAdapter.height(140),
                    alignment: Alignment.center,
                    child: const Text(
                      "新建收货地址",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
