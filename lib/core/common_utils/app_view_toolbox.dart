import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewToolBox {
  static void showErrorMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showSuccessMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // static void showLoading() {
  //   EasyLoading.instance
  //     ..loadingStyle = EasyLoadingStyle.custom
  //     ..indicatorSize = 40.w
  //     ..textColor = AppColors.white
  //     ..radius = 20
  //     ..backgroundColor = AppColors.semiLightBlack
  //     ..maskColor = AppColors.semiLightBlack
  //     ..indicatorColor = AppColors.white
  //     ..userInteractions = false
  //     ..dismissOnTap = false
  //     ..boxShadow = <BoxShadow>[]
  //     ..indicatorType = EasyLoadingIndicatorType.circle;
  //   EasyLoading.show();
  // }

  // static void dismissLoading() {
  //   EasyLoading.dismiss();
  // }
}
