// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:housepetall/src/presentation/widgets/widgets.dart';

class ErrorScreen extends StatelessWidget {
  final String errorCode;
  final String title;
  final String description;
  const ErrorScreen({
    super.key,
    this.errorCode = '404',
    this.title = 'Something went wrong',
    this.description = 'I wish I had enough time to finish this page. :(',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(withBack: true),
      body: Align(
        alignment: Alignment(0, -.5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Empty(
            imageAsset: 'assets/images/error/$errorCode.svg',
            title: title,
            description: description,
          ),
        ),
      ),
    );
  }
}
