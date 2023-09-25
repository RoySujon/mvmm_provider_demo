import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/repository/login/login_repository.dart';
import 'package:mvmm_provider_demo/utils/utils.dart';

class LoginScreenModel extends ChangeNotifier {
  final _loginApiRepository = LoginApiRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _loginApiRepository.loginApi(data).then((value) {
      if (kDebugMode) {
        print(value.toString());
        Utils.flushbarErrorMessage(
            context, 'Login Success : ' + value['token']);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushbarErrorMessage(context, 'Error');
        print(error.toString());
      }
    });
  }
}
