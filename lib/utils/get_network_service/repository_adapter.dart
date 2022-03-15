import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import '../../data/model/Home/menu_model.dart';

import '../../data/model/InfluenceRegistration/influencer_registration_model.dart';
import '../../data/model/checkout_order/multi_address_model.dart';

abstract class ISplashRepository {
  Future<String> getSplashAPIResponse();
}
abstract class IReferFriendRepository {
  Future<String> getReferFriendAPIResponse();
}

abstract class ILoginRepository {
  Future<String> getLoginAPIResponse(String loginRequestJson, String userName, String password);
}

abstract class ISignupRepository {
  Future<SignUpResponseModel> getSignupAPIResponse(String signupRequestJson);
}

abstract class IInfluencerRepository {
  Future<InfluencerRegistrationMethodModel> getInfluencerAPIResponse(
      String influencerRequestJson);
}

abstract class IDashboardRepository {
  Future<MenuModel> getMenuAPIResponse();
}

abstract class IHomeRepository {

}

abstract class ICountryRepository {
  Future<String> getStoreWebsitesAPIResponse();
  Future<String> getStoreViewsAPIResponse();
  Future<String> getStoreConfigsAPIResponse();
}

abstract class ICheckoutOrderRepository {
  Future<String> postEstimateAPIResponse(String requestJson);
  Future<ShippingInformationModel> postShippingInformationAPIResponse(String requestJson);
  Future<String> getMultiAddressAPIResponse();
}

