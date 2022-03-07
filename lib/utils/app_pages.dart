import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_binding.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/home/home_screen.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_binding.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_screen.dart';
import 'package:solo_luxury/app/screens/splash/splash_binding.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_screen.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../app/screens/influencer_registraction/influencer_binding.dart';
import '../app/screens/influencer_registraction/influencer_registration_screen.dart';
import '../app/screens/product_listing/product_list_binding.dart';
import '../app/screens/product_listing/product_list_screen.dart';
import '../app/screens/search/search_screen.dart';
import '../app/screens/checkout_order/checkout_order_screen.dart';
import '../app/screens/splash/splash_screen.dart';
import '../app/screens/wishlist/wishlist_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.productListScreen,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.productsScreen,
      page: () => const SearchScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: RoutesConstants.wishlistScreen,
      page: () => MyWishListPage(),
      binding: WishlistBindings(),
    ),
    GetPage(
      name: RoutesConstants.checkoutOrderScreen,
      page: () => const CheckoutOrderScreen(),
      binding: CheckoutOrderBindings(),
    ),
    GetPage(
      name: RoutesConstants.influencerRegistrationScreen,
      page: () => InfluencerRegistrationScreen(),
      binding: InfluencerRegistrationBindings(),
    ),
    GetPage(
      name: RoutesConstants.myAccountScreenScreen,
      page: () => MyAccountScreen(),
      binding: MyAccountBinding(),
    ),
  ];
}
