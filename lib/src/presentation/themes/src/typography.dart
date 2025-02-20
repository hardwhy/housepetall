import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum VariantStyle { bold, regular }

enum VariantSize { big, small }

enum Variant { strong, normal, large, small }

abstract class Typography extends StatelessWidget {
  final String text;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? align;
  final VariantStyle? variantStyle;

  const Typography({
    super.key,
    required this.text,
    this.color,
    this.overflow,
    this.maxLines,
    this.align,
    this.variantStyle = VariantStyle.regular,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle().copyWith(
        color: color,
      ),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  TextStyle getTextStyle();
}

class Body1 extends Typography {
  const Body1(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.maxLines,
    super.align,
    super.variantStyle,
  }) : super(
          text: text,
        );

  const Body1.bold(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.maxLines,
    super.align,
  }) : super(
          text: text,
          variantStyle: VariantStyle.bold,
        );

  @override
  TextStyle getTextStyle() {
    switch (variantStyle) {
      case VariantStyle.bold:
        return GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color ?? Colors.black,
        );
      default:
        return GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: color ?? Colors.black,
        );
    }
  }
}

class Paragraph extends Typography {
  const Paragraph(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.maxLines,
    super.align,
    super.variantStyle,
  }) : super(
          text: text,
        );

  const Paragraph.bold(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.maxLines,
    super.align,
  }) : super(text: text, variantStyle: VariantStyle.bold);

  @override
  TextStyle getTextStyle() {
    switch (variantStyle) {
      case VariantStyle.bold:
        return GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color ?? Colors.black,
        );
      default:
        return GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: color ?? Colors.black,
        );
    }
  }
}

class H1 extends Typography {
  const H1(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.align,
    super.maxLines,
    super.variantStyle,
  }) : super(text: text);

  @override
  TextStyle getTextStyle() {
    return GoogleFonts.nunito(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }
}

class H2 extends Typography {
  const H2(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.align,
    super.variantStyle,
  }) : super(text: text);

  @override
  TextStyle getTextStyle() {
    return GoogleFonts.nunito(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }
}

class H3 extends Typography {
  const H3(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.align,
    super.variantStyle,
  }) : super(text: text);

  @override
  TextStyle getTextStyle() {
    return GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }
}

class ButtonTitle extends Typography {
  final VariantSize size;
  const ButtonTitle(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.align,
    required this.size,
  }) : super(text: text);

  const ButtonTitle.big(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.align,
    super.maxLines,
  })  : size = VariantSize.big,
        super(text: text);

  const ButtonTitle.small(
    String text, {
    super.key,
    super.color,
    super.overflow,
    super.align,
    super.maxLines,
  })  : size = VariantSize.small,
        super(text: text);

  @override
  TextStyle getTextStyle() {
    switch (size) {
      case VariantSize.big:
        return GoogleFonts.nunito(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color ?? Colors.black,
        );
      default:
        return GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: color ?? Colors.black,
        );
    }
  }
}
