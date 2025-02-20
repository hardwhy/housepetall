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
  String get commonErrorTitle => 'Terjadi kesalahan';

  @override
  String get commonErrorDescription => 'Andai ada injury time. :(';

  @override
  String get commonOptionalLabel => '(opsional)';
}
