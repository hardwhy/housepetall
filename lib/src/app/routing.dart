import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/screen/errors/not_found.dart';
import 'package:housepetall/src/presentation/screen/review/pages/review.dart';
import 'package:housepetall/src/presentation/screen/review/pages/review_detail.dart';
import 'package:housepetall/src/presentation/screen/review/pages/review_submission.dart';
import 'package:housepetall/src/presentation/screen/splash/splash.dart';

import 'routes.dart';

MaterialPageRoute<void> generateRoute(RouteSettings routeSettings) {
  final routeName = routeSettings.name;
  final arguments = routeSettings.arguments;

  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeName) {
        case Routes.root:
          return const SplashScreen();
        case ReviewRoutes.root:
          return const ReviewScreen();
        case ReviewRoutes.detail:
          arguments as ReviewDetailProp;
          return ReviewDetail(prop: arguments);
        case ReviewRoutes.submit:
          return const ReviewSubmission();
        default:
          return ErrorScreen();
      }
    },
  );
}
