import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/repository/auth_repository.dart';
import 'package:mvmm_provider_demo/utils/routes/routes_name.dart';
import 'package:mvmm_provider_demo/utils/utils.dart';
import 'package:mvmm_provider_demo/view/home/home_screen.dart';

class AuthViewModel extends ChangeNotifier {
  final _loginApiRepository = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(
      dynamic data,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    setLoading(true);
    _loginApiRepository.loginApi(data).then((value) {
      setLoading(false);

      emailController.clear();
      passwordController.clear();

      // notifyListeners();

      if (kDebugMode) {
        print(value.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
        Utils.flushbarErrorMessage(
            // ignore: prefer_interpolation_to_compose_strings
            context,
            // ignore: prefer_interpolation_to_compose_strings
            "Login Success : " + value['token'].toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        Utils.flushbarErrorMessage(context, error.toString());
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(
      dynamic data,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    setLoading(true);

    _loginApiRepository.signUpApi(data).then((value) {
      setLoading(false);

      emailController.clear();

      passwordController.clear();

      // notifyListeners();

      if (kDebugMode) {
        print(value.toString());

        Navigator.pushNamed(
          context, RoutesName.homeScreen,

          // arguments: ArgumentPass.arguments(value)
        );

        Utils.flushbarErrorMessage(context, 'Sign Up Success : ${value['id']}');
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        Utils.flushbarErrorMessage(context, error.toString());

        print(error.toString());
      }
    });
  }
}

// class ArgumentPass {
//   static Map<String, dynamic> arguments(var value) => {
//         'message': 'Sucessfull',
//         'value': value,
//       };
// }
