import 'package:flutter/material.dart';

extension ColorOpacityBridge on Color {
  Color adjustOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }
}
