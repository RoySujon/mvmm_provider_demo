import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvmm_provider_demo/res/cololors.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

// Flushbar
  static flushbarErrorMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(30),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: AppColor.kBackgroundColor,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 28,
        icon: const Icon(Icons.error, size: 28, color: AppColor.kTextColor),
      )..show(context),
    );
  }

  //focusNode
  static fieldFocusNode(
      FocusNode cureent, FocusNode nextFocusNode, BuildContext context) {
    cureent.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}
