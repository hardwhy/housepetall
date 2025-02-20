import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'languages_en.dart';
import 'languages_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of HousePetAllLocalization
/// returned by `HousePetAllLocalization.of(context)`.
///
/// Applications need to include `HousePetAllLocalization.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/languages.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HousePetAllLocalization.localizationsDelegates,
///   supportedLocales: HousePetAllLocalization.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the HousePetAllLocalization.supportedLocales
/// property.
abstract class HousePetAllLocalization {
  HousePetAllLocalization(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HousePetAllLocalization? of(BuildContext context) {
    return Localizations.of<HousePetAllLocalization>(context, HousePetAllLocalization);
  }

  static const LocalizationsDelegate<HousePetAllLocalization> delegate = _HousePetAllLocalizationDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'housepetall'**
  String get appTitle;

  /// No description provided for @reviewHome.
  ///
  /// In en, this message translates to:
  /// **'Our reviews'**
  String get reviewHome;

  /// No description provided for @reviewHomeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get reviewHomeEmptyTitle;

  /// No description provided for @reviewHomeEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Be the first by clicking the button below!'**
  String get reviewHomeEmptyDescription;

  /// No description provided for @reviewHomeSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit a review'**
  String get reviewHomeSubmitButton;

  /// No description provided for @reviewDetailNameFormat.
  ///
  /// In en, this message translates to:
  /// **'%s\'s review'**
  String get reviewDetailNameFormat;

  /// No description provided for @reviewFormRatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get reviewFormRatingLabel;

  /// No description provided for @reviewFormNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get reviewFormNameLabel;

  /// No description provided for @reviewFormPetNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Pets Name'**
  String get reviewFormPetNameLabel;

  /// No description provided for @reviewFormCommentLabel.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get reviewFormCommentLabel;

  /// No description provided for @reviewFormSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get reviewFormSubmitButton;

  /// No description provided for @reviewFormTitle.
  ///
  /// In en, this message translates to:
  /// **'Give a Review'**
  String get reviewFormTitle;

  /// No description provided for @reviewFormNamePlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get reviewFormNamePlaceHolder;

  /// No description provided for @reviewFormPetsNamePlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'ex: Garfield'**
  String get reviewFormPetsNamePlaceHolder;

  /// No description provided for @reviewFormCommentPlaceHolder.
  ///
  /// In en, this message translates to:
  /// **'Any additional comments and much appreciated!'**
  String get reviewFormCommentPlaceHolder;

  /// No description provided for @reviewFormPetsNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Pet\'s Name'**
  String get reviewFormPetsNameLabel;

  /// No description provided for @commonErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonErrorTitle;

  /// No description provided for @commonErrorDescription.
  ///
  /// In en, this message translates to:
  /// **'I wish I had enough time to finish this page. :('**
  String get commonErrorDescription;

  /// No description provided for @commonOptionalLabel.
  ///
  /// In en, this message translates to:
  /// **'(optional)'**
  String get commonOptionalLabel;
}

class _HousePetAllLocalizationDelegate extends LocalizationsDelegate<HousePetAllLocalization> {
  const _HousePetAllLocalizationDelegate();

  @override
  Future<HousePetAllLocalization> load(Locale locale) {
    return SynchronousFuture<HousePetAllLocalization>(lookupHousePetAllLocalization(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_HousePetAllLocalizationDelegate old) => false;
}

HousePetAllLocalization lookupHousePetAllLocalization(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return HousePetAllLocalizationEn();
    case 'id': return HousePetAllLocalizationId();
  }

  throw FlutterError(
    'HousePetAllLocalization.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
