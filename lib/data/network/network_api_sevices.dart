import 'dart:convert';
import 'dart:io';

import 'package:mvmm_provider_demo/data/app_exception.dart';
import 'package:mvmm_provider_demo/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getResponse(String uri) {
    // TODO: implement getResponse
    throw UnimplementedError();
  }

  @override
  Future postResponse(String uri, data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(uri), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      default:
        throw FetchDataException(
            'Error Occured While Communication with server');
    }
  }
}
