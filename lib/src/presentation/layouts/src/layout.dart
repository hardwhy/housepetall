// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class Layout extends StatelessWidget {
  final String? title;
  final Widget child;
  const Layout({
    super.key,
    this.title,
    required this.child,
  });

  PreferredSizeWidget appBarBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 50),
        child: child,
      ),
    );
  }
}
