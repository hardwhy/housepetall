import 'languages.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class HousePetAllLocalizationEn extends HousePetAllLocalization {
  HousePetAllLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'housepetall';

  @override
  String get reviewHome => 'Our reviews';

  @override
  String get reviewHomeEmptyTitle => 'No reviews yet';

  @override
  String get reviewHomeEmptyDescription => 'Be the first by clicking the button below!';

  @override
  String get reviewHomeSubmitButton => 'Submit a review';

  @override
  String get reviewDetailNameFormat => '%s\'s review';

  @override
  String get reviewFormRatingLabel => 'Rating';

  @override
  String get reviewFormNameLabel => 'Name';

  @override
  String get reviewFormPetNameLabel => 'Pets Name';

  @override
  String get reviewFormCommentLabel => 'Comment (optional)';

  @override
  String get reviewFormSubmitButton => 'Submit';

  @override
  String get commonErrorTitle => 'Something went wrong';

  @override
  String get commonErrorDescription => 'I wish I had enough time to finish this page. :(';
}
