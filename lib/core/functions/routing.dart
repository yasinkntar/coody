import 'package:flutter/material.dart';

pushTo(BuildContext context, Widget newView) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newView,
  ));
}

pushToWithReplacement(BuildContext context, Widget newView) {

  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newView,
  ));
}

pushAndRemoveUntil(BuildContext context, Widget newView) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => newView,
      ),
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      (Route) => false);
}
