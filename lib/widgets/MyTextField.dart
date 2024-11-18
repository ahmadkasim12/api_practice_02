import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool hasLabel;
  final String? label;
  final String? textHint;
  final Color? fillColor;
  final Color? borderColor;
  final Text? text;
  final TextStyle? textColor;
  final TextEditingController controller;

  const MyTextField({super.key, required this.hasLabel, this.label, this.textHint, this.fillColor, this.borderColor, this.textColor, required this.controller, this.text});

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      hintText: textHint,
      hintStyle: TextStyle(color: Colors.white12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white12, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? Colors.white12, width: 1),
      ),
      contentPadding: const EdgeInsets.all(14),
      isCollapsed: true,
      filled: true,
      fillColor: fillColor ?? Colors.white12,
    );

    final textField = TextField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      style: textColor ?? TextStyle(color: Colors.white54),
      decoration: inputDecoration,
    );

    return hasLabel
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? "", style: TextStyle(color: Colors.white60)),
        const SizedBox(height: 6.18),
        textField,
      ],
    )
        : textField;
  }
}
