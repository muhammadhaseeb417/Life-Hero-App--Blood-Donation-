import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String field;
  final Icon iconData;
  final int limit;
  final RegExp regExp;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.field,
    required this.iconData,
    required this.regExp,
    required this.limit,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(field),
        TextFormField(
          controller: controller != null ? controller : null,
          inputFormatters: [
            LengthLimitingTextInputFormatter(limit),
            FilteringTextInputFormatter.allow(regExp)
          ],
          decoration: InputDecoration(
            hintText: "Enter your ${field.toLowerCase()}",
            prefixIcon: iconData,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
