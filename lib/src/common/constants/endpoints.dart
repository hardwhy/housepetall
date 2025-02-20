import 'package:housepetall/config.dart';

class Endpoints {
  static const review = _Review();
}

class _Review {
  const _Review();
  String get getReviews => '${Config.host}/reviews/';
  String get createReviews => '${Config.host}/reviews/create';
}
