import 'languages.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class HousePetAllLocalizationId extends HousePetAllLocalization {
  HousePetAllLocalizationId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'housepetall';

  @override
  String get reviewHome => 'Ulasan';

  @override
  String get reviewHomeEmptyTitle => 'Belum ada ulasan';

  @override
  String get reviewHomeEmptyDescription => 'Jadi yang pertama mengulas kami!';

  @override
  String get reviewHomeSubmitButton => 'Kirimkan ulasan';

  @override
  String get reviewDetailNameFormat => 'Ulasan %s';

  @override
  String get reviewFormRatingLabel => 'Rating';

  @override
  String get reviewFormNameLabel => 'Nama';

  @override
  String get reviewFormPetNameLabel => 'Nama Perliharaan';

  @override
  String get reviewFormCommentLabel => 'Komentar';

  @override
  String get reviewFormSubmitButton => 'Kirim';

  @override
  String get reviewFormTitle => 'Berikan Ulasan';

  @override
  String get reviewFormNamePlaceHolder => 'Nama kamu';

  @override
  String get reviewFormPetsNamePlaceHolder => 'contoh: Garfield';

  @override
  String get reviewFormCommentPlaceHolder => 'Komentarmu kita harepin lho!';

  @override
  String get reviewFormPetsNameLabel => 'Nama Peliharaan';

  @override
  String get reviewFormRequiredError => 'Bagian ini perlu diisi';

  @override
  String get reviewFormSucceedSubmitTitle => 'Review has been submitted';

  @override
  String get reviewFormSucceedSubmitButtonTitle => 'Go Home';

  @override
  String get reviewFormSucceedSubmitMessage => 'Your review is meaningful for us!';

  @override
  String get reviewFormFailedSubmitMessage => 'Please try to re-submit!';

  @override
  String get reviewFormFailedSubmitButtonTitle => 'Close';

  @override
  String get commonErrorTitle => 'Terjadi kesalahan';

  @override
  String get commonErrorDescription => 'Andai ada injury time. :(';

  @override
  String get commonOptionalLabel => '(opsional)';

  @override
  String get commonButtonTitleYes => 'Yes, I mean it';

  @override
  String get commonButtonTitleNo => 'No, just kidding';

  @override
  String get commonExitConfirmationTitle => 'Are you sure?';

  @override
  String get commonExitConfirmationMessage => 'You are about to leave this page';
}
