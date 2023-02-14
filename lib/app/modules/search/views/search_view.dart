import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          title: Center(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: ScreenAdapter.width(840),
                  height: ScreenAdapter.height(96),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    autofocus: true,
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(36)), // 修改搜索框内容的字体大小
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0), // 输入内容上下居中
                        prefixIcon: const Icon(Icons.search),
                        // hintText: '手机',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            // 输入框的边框
                            borderSide: BorderSide.none)),
                    onChanged: (value) {
                      controller.keyWords = value;
                    },
                    // 监听键盘的回车事件
                    onSubmitted: (value) {
                      // // Get.toNamed('/product-list', arguments: {"keyWords": value});
                      // // 替换路由，直接返回到跟路由
                      // Get.offAndToNamed('/product-list',
                      //     arguments: {"keyWords": value});
                      controller.toSearch();
                    },
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                controller.toSearch();
              },
              child: Text(
                '搜索',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: ScreenAdapter.fontSize(36),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.height(20)),
          children: [
            Obx(() => controller.searchHistoryList.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '历史记录',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenAdapter.fontSize(42)),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                title: '提示',
                                middleText: '您确定要清空历史搜索记录吗?',
                                cancel: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      shadowColor: MaterialStateProperty.all(
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
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.white)),
                                  onPressed: () {
                                    controller.clearSearchHistoryData();
                                    Get.back();
                                  },
                                  child: const Text('确定'),
                                ));
                          },
                          icon: const Icon(Icons.delete_forever))
                    ],
                  )
                : const SizedBox()),
            Obx(() => Wrap(
                  children: controller.searchHistoryList
                      .map((element) => InkWell(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  ScreenAdapter.width(32),
                                  ScreenAdapter.height(16),
                                  ScreenAdapter.width(32),
                                  ScreenAdapter.height(16)),
                              margin: EdgeInsets.all(ScreenAdapter.width(16)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Text(element),
                            ),
                            onLongPress: () {
                              Get.defaultDialog(
                                  title: '提示',
                                  middleText: '确定要删除该条数据吗?',
                                  cancel: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        shadowColor: MaterialStateProperty.all(
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
                                        shadowColor: MaterialStateProperty.all(
                                            Colors.white)),
                                    onPressed: () {
                                      controller
                                          .deleteSearchHistoryData(element);
                                      Get.back();
                                    },
                                    child: const Text('确定'),
                                  ));
                            },
                          ))
                      .toList(),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: ScreenAdapter.height(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '猜你想搜',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42)),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
                ],
              ),
            ),
            Wrap(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.height(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.height(16)),
                  margin: EdgeInsets.all(ScreenAdapter.width(16)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: const Text('手机'),
                )
              ],
            ),
            // 热销商品
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
                    width: double.infinity,
                    height: ScreenAdapter.height(138),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/hotSearch.png"))),
                  ),
                  GridView.builder(
                      shrinkWrap:
                          true, // 收缩，解决嵌套list view 和grid view 布局无法自适应的问题
                      physics:
                          const NeverScrollableScrollPhysics(), // 解决嵌套的滑动冲突问题
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: ScreenAdapter.width(40),
                          mainAxisSpacing: ScreenAdapter.height(20),
                          childAspectRatio: 3 / 1),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: ScreenAdapter.width(120),
                              alignment: Alignment.center,
                              child: Image.network(
                                  'https://www.itying.com/images/focus/focus02.png'),
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              child: const Text('11111111111111111111111'),
                            )),
                          ],
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
