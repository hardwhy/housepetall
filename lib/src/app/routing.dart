import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/screen/errors/not_found.dart';
import 'package:housepetall/src/presentation/screen/review/review.dart';
import 'package:housepetall/src/presentation/screen/review/review_detail.dart';

import 'routes.dart';

MaterialPageRoute<void> generateRoute(RouteSettings routeSettings) {
  final routeName = routeSettings.name;
  final arguments = routeSettings.arguments;

  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeName) {
        case Routes.root:
        case ReviewRoutes.root:
          return const ReviewScreen();
        case ReviewRoutes.detail:
          arguments as ReviewDetailProp;
          return ReviewDetail(prop: arguments);
        case ReviewRoutes.submit:
        default:
          return ErrorScreen();
      }
    },
  );
}
