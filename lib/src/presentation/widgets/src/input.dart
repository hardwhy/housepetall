import 'package:flutter/material.dart';
import 'package:housepetall/src/common/util/color.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';

class Input extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final bool mandatory;
  final int? maxLine;
  final int minLine;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  const Input({
    super.key,
    this.label,
    this.placeholder,
    this.mandatory = false,
    this.maxLine = 1,
    this.minLine = 1,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Body1.bold(label!),
                if (mandatory)
                  Body1.bold(
                    '*',
                    color: Colors.red,
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Body1.bold(
                      context.strings.commonOptionalLabel,
                      color: Colors.black38,
                    ),
                  )
              ],
            ),
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          minLines: minLine,
          maxLines: maxLine,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            fillColor: Colors.deepOrange[50]!.adjustOpacity(.7),
            hintText: placeholder,
          ),
        ),
      ],
    );
  }
}
