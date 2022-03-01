import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/Product/product_model.dart';

class WishlistController extends GetxController {
  RxInt index = 0.obs;
  RxString chosenValue = 'My WishList'.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  var wishlistProductList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<ProductModel>> getWishlistProducts() async {
    wishlistProductList.value = await getWishlistProducts();
    return wishlistProductList.value;
  }

  Future<bool> deleteWishlistProduct(String id) async {
    return await deleteWishlistProduct(id);
  }

  Future<bool> postWishlistProduct(String sku) async {
    return await postWishlistProduct(sku);
  }
}