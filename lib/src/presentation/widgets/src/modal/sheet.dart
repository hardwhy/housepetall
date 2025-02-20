import 'package:flutter/material.dart';

Future<T?> showSheet<T>(
  context, {
  bool? isScrollControlled,
  bool isDismissible = true,
  Widget? child,
  Color? backgroundColor,
  EdgeInsets? contentPadding = const EdgeInsets.symmetric(horizontal: 24),
}) {
  return showModalBottomSheet<T>(
    context: context,
    isDismissible: isDismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    isScrollControlled: isScrollControlled ?? false,
    constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - (kToolbarHeight)),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Container(
              padding: contentPadding,
              color: backgroundColor,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 4,
                    width: 62,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.deepOrange,
                    ),
                  ),
                  if (child != null) Flexible(child: child),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
