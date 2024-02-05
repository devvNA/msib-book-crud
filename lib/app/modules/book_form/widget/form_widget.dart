// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class BookForm extends StatelessWidget {
  const BookForm({
    Key? key,
    this.value,
    required this.title,
    this.isEnabled,
    this.onChanged,
  }) : super(key: key);

  final String? value;
  final String title;
  final bool? isEnabled;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      initialValue: value,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(
          color: AppColor.color1,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
