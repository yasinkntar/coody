// error

import 'package:flutter/material.dart';


showErrorDialog(context, errorText) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      content: Text(errorText)));
}

// loading
showLoadingDialog(BuildContext context) {
  //------------ Using Custom Loading for IOS & Android

  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    builder: (BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png', width: 150, height: 150),
        ],
      );
    },
  );
}

showCusomteDialog(BuildContext context, Widget customedilog) {
  //------------ Using Custom Loading for IOS & Android

  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.7),
    context: context,
    builder: (BuildContext context) {
      return customedilog;
    },
  );
}
