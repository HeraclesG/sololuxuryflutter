import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_model.dart';
import 'package:solo_luxury/data/model/sign_up/user_detail_model.dart';

import '../../app/components/storage_constant.dart';

class LocalStore {
  static final LocalStore _singleton = LocalStore._internal();

  factory LocalStore() {
    return _singleton;
  }

  LocalStore._internal();

  var currentCode = "";
  var currentCurrency = "";
  var customerToken = "";
  var website_id = "";
  var guestToken = "";
  var isGuest = false;
  var store_group_id = "";
  var default_group_id = "";
  var name = "";
  UserDetail userDetail = UserDetail();

  getStore() async {
    print("getStore -> ");
    String data = await getPrefStringValue(key_local_store_model);
    if (data != null && data.isNotEmpty) {
      LocalStoreModel localStoreModel =
          LocalStoreModel.fromJson(jsonDecode(data));
      currentCode = localStoreModel.currentCode!;
      currentCurrency = localStoreModel.currentCurrency!;
      name = localStoreModel.name!;
      website_id = localStoreModel.getStore(currentCode)!.websiteId.toString();
      store_group_id =
          localStoreModel.getStore(currentCode)!.storeGroupId.toString();
      default_group_id = store_group_id;
      print("currentCode -> " + currentCode);
      print("currentCurrency -> " + currentCurrency);
      print("website_id -> " + website_id);
      print("store_group_id -> " + store_group_id);
      print("default_group_id -> " + default_group_id);
      print("name -> " + name);
      Get.updateLocale(Locale(localStoreModel.currentCode!.split("-")[1]));
      return true;
    }
    return false;
  }

  getToken() async {
    print("getToken -> ");
    String data = await getPrefStringValue(StorageConstant.authToken);
    if (data != null && data.isNotEmpty) {
      customerToken = "Bearer " + data;
      print("token -> " + customerToken);
      return true;
    }
  }

  getUserDetail() async {
    print("getUserDetail -> ");
    String data = await getPrefStringValue(StorageConstant.userDetail);
    if (data != null && data.isNotEmpty) {
     userDetail = UserDetail.fromJson(jsonDecode(data));
      return true;
    }
  }

  getGuestToken() async {
    print("getGuestToken -> ");
    String data = await getPrefStringValue(StorageConstant.guestauthToken);
    if (data != null && data.isNotEmpty) {
      guestToken = data;
      print("token -> " + guestToken);
      return true;
    }
  }

  getRegularPriceWithCurrency(String price, regularPrice) {
    if (currentCurrency == 'EUR') {
      return "€" + price;
    }
    return regularPrice;
  }

  getPriceWithSymbol(String price) {
    if (currentCurrency == 'EUR') {
      return "€" + price;
    }
    return currentCurrency + " " + price;
  }

  setItemPriceWithSymbol(String price, String basePriceInclTax) {
    if (currentCurrency == 'EUR') {
      return "€" + basePriceInclTax;
    }
    return currentCurrency + " " + price;
  }

  checkGuest(){
    if(customerToken.isNotEmpty){
      isGuest = false;
    }else{
      isGuest = true;
    }
  }
}
