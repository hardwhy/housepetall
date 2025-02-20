import 'package:flutter/material.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class TopBar extends AppBar {
  final bool withBack;
  final VoidCallback? onBack;
  TopBar({
    super.key,
    String? title,
    this.withBack = true,
    this.onBack,
  }) : super(
            automaticallyImplyLeading: false,
            title: H2(title ?? ''),
            centerTitle: false,
            leading: withBack ? Back(onTap: onBack) : null,
            backgroundColor: Colors.white,
            scrolledUnderElevation: 2);
}
