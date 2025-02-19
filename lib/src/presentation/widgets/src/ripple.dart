// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:housepetall/src/common/util/color.dart';

abstract class RippleWrapper extends StatelessWidget {
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final BoxConstraints? constraints;
  final Widget? child;
  final BorderRadius? rippleBorderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? rippleColor;

  final Alignment? alignment;

  const RippleWrapper({
    super.key,
    this.onTap,
    this.height,
    this.width,
    this.decoration,
    this.child,
    this.rippleBorderRadius,
    this.padding,
    this.margin,
    this.alignment,
    this.rippleColor,
    this.constraints,
  });

  @protected
  Widget childContainer(BuildContext context, Widget? child);

  @protected
  Widget decoratorContainer(BuildContext context, Widget child);

  @override
  Widget build(BuildContext context) {
    return decoratorContainer(
      context,
      Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor:
              (rippleColor ?? Colors.deepOrange[100])!.adjustOpacity(.5),
          splashColor: (rippleColor ?? Colors.deepOrange).adjustOpacity(.5),
          borderRadius: rippleBorderRadius ?? BorderRadius.circular(8),
          onTap: onTap,
          child: childContainer(context, child),
        ),
      ),
    );
  }
}

/// A simple implementation of [RippleWrapper] that uses a [Container] as its child.
class Ripplify extends RippleWrapper {
  const Ripplify({
    super.key,
    super.onTap,
    super.height,
    super.width,
    super.decoration,
    super.child,
    super.rippleBorderRadius,
    super.padding,
    super.margin,
    super.rippleColor,
    super.alignment,
    super.constraints,
  });

  @override
  Widget childContainer(BuildContext context, Widget? child) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      alignment: alignment,
      constraints: constraints,
      child: child,
    );
  }

  @override
  Widget decoratorContainer(BuildContext context, Widget child) {
    return Container(
      decoration: decoration,
      margin: margin,
      child: child,
    );
  }
}
