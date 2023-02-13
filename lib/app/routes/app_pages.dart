import 'package:get/get.dart';

import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    // GetPage(
    //   name: _Paths.CATEGORY,
    //   page: () => const CategoryView(),
    //   binding: CategoryBinding(),
    // ),
    // GetPage(
    //   name: _Paths.GIVE,
    //   page: () => const GiveView(),
    //   binding: GiveBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CART,
    //   page: () => const CartView(),
    //   binding: CartBinding(),
    // ),
    // GetPage(
    //   name: _Paths.USER,
    //   page: () => const UserView(),
    //   binding: UserBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SEARCH,
    //   page: () => const SearchView(),
    //   binding: SearchBinding(),
    // ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
  ];
}
