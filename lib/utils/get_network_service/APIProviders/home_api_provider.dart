import 'package:get/get.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../data/model/Home/menu_model.dart';

abstract class IHomeProvider {
  Future<Response<MenuModel>> getMenuResponseProvider(
      {required String endPoint});
}

class HomeAPIProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew;
  }

  @override
  Future<Response<MenuModel>> getMenuResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }

  Future<Response> getBannerListAPIResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    httpClient.baseUrl = AppConstants.apiEndPointNew2;
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken1
    });
  }
}
