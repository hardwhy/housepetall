class Assets {
  static const images = _Image();
}

class _Image {
  const _Image();

  String get _root => 'assets/images';
  String get splash => '$_root/app_logo.svg';
}
