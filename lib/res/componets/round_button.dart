import 'package:flutter/material.dart';
import 'package:mvmm_provider_demo/res/cololors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool loading;
  const RoundButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
        onPressed: onTap,
        child: loading
            ? Container(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: AppColor.kTextColor,
                  backgroundColor: AppColor.kMainColor,
                ))
            : Text(title));
  }
}
