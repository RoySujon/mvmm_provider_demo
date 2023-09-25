import 'package:mvmm_provider_demo/data/network/base_api_services.dart';
import 'package:mvmm_provider_demo/data/network/network_api_sevices.dart';
import 'package:mvmm_provider_demo/res/app_url/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final res = await _apiServices.postResponse(AppUrl.loginUrl, data);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      final res = await _apiServices.postResponse(AppUrl.signUpUrl, data);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
