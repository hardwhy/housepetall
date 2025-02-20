class ReviewConstants {
  static const assets = _ReviewAssetPath();
  static const heroTags = _ReviewHeroTags();
}

class _ReviewAssetPath {
  const _ReviewAssetPath();
  String get root => 'assets/images/reviews';
  String get empty => '$root/empty.svg';
  String get detail => '$root/detail.svg';
  String get success => '$root/success.svg';
  String get quit => '$root/quit.svg';
}

class _ReviewHeroTags {
  const _ReviewHeroTags();

  String get reviewContent => 'reviewContent%s';
}

