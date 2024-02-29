import 'package:flutter/material.dart';

// pushTo(BuildContext context, Widget newView) {
//   Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) => newView,
//   ));
// }

// pushToA(BuildContext context, Widget newView) {
//   Navigator.of(context).push(PageRouteBuilder(
//     transitionDuration: const Duration(seconds: 1),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//         ScaleTransition(
//             scale: animation, child: child, alignment: Alignment.centerLeft),
//     pageBuilder: (context, animation, secondaryAnimation) => newView,
//   ));
// }
pushTo(BuildContext context, Widget newView,
    {AxisDirection axis = AxisDirection.left}) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => newView,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = getBeginOffset(axis);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  ));
}

pushToWithReplacement(BuildContext context, Widget newView,
    {AxisDirection axis = AxisDirection.left}) {
  Navigator.of(context).pushReplacement(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => newView,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = getBeginOffset(axis);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  ));
}

pushAndRemoveUntil(BuildContext context, Widget newView,
    {AxisDirection axis = AxisDirection.left}) {
  Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => newView,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = getBeginOffset(axis);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
      (route) => false);
}

Offset getBeginOffset(AxisDirection axis) {
  switch (axis) {
    case AxisDirection.up:
      return const Offset(0, 1);
    case AxisDirection.down:
      return const Offset(0, -1);
    case AxisDirection.right:
      return const Offset(-1, 0);
    case AxisDirection.left:
      return const Offset(1, 0);
    default:
      return const Offset(0, 1);
  }
}
