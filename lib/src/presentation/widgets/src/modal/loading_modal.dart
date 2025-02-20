import 'package:flutter/material.dart';

showLoadingModal({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircularProgressIndicator(
            strokeWidth: 5,
            color: Colors.deepOrange,
          ),
        ),
      );
    },
  );
}
