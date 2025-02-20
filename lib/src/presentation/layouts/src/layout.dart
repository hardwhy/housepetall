// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class Layout extends StatelessWidget {
  final String? title;
  final Widget child;
  final Widget? footer;
  final bool withPadding;
  const Layout({
    super.key,
    this.title,
    required this.child,
    this.withPadding = true,
    this.footer,
  });

  PreferredSizeWidget appBarBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: withPadding
                    ? const EdgeInsets.fromLTRB(24, 24, 24, 0)
                    : EdgeInsets.zero,
                child: child,
              ),
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}
