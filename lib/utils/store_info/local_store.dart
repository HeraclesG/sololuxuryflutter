
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/app/screens/country/country_binding.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_model.dart';

import '../../app/components/storage_constant.dart';
import '../get_network_service/APIProviders/country_api_provider.dart';
import '../get_network_service/APIRepository/country_api_repository.dart';

class LocalStore{
  static final LocalStore _singleton = LocalStore._internal();
  factory LocalStore() {
    return _singleton;
  }
  LocalStore._internal();

  var currentCode = "";
  var currentCurrency = "";
  var loginToken = "";

  getStore() async {
    print("getStore -> ");
    String data = await getPrefStringValue(key_local_store_model);
    if(data!=null && data.isNotEmpty) {
      LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
      currentCode = localStoreModel.currentCode!;
      currentCurrency = localStoreModel.currentCurrency!;
      print("currentCode -> " + currentCode);
      print("currentCurrency -> " + currentCurrency);
      Get.updateLocale(Locale(localStoreModel.currentCode!.split("-")[1]));
      return true;
    }
    return false;
  }

  getToken() async {
    print("getToken -> ");
    String data = await getPrefStringValue(StorageConstant.authToken);
    if(data!=null && data.isNotEmpty) {
      loginToken = data;
      print("token -> " + loginToken);
      return true;
    }
  }

}