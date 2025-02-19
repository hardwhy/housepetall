import 'package:flutter/material.dart';
import 'package:housepetall/src/localization/localization.dart';
export 'languages.dart';

extension LanguageContext on BuildContext {
  HousePetAllLocalization get strings => HousePetAllLocalization.of(this)!;
}
