class Endpoints {
  static const review = _Review();
}

class _Review {
  const _Review();
  String get getReviews => '/reviews/';
  String get createReviews => '/reviews/create';
}
