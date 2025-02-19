import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/screen/errors/not_found.dart';
import 'package:housepetall/src/presentation/screen/review/review.dart';

import 'routes.dart';

MaterialPageRoute<void> generateRoute(RouteSettings routeSettings) {
  return MaterialPageRoute<void>(
    settings: routeSettings,
    builder: (BuildContext context) {
      switch (routeSettings.name) {
        case Routes.root:
        case ReviewRoutes.root:
          return const ReviewScreen();
        case ReviewRoutes.detail:
        case ReviewRoutes.submit:
        default:
          return ErrorScreen();
      }
    },
  );
}
