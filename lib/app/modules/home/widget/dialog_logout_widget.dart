// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class DialogLogoutWidget extends StatelessWidget {
  const DialogLogoutWidget({
    Key? key,
    required this.tapYes,
    required this.tapNo,
  }) : super(key: key);

  final VoidCallback tapYes;
  final VoidCallback tapNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Are you sure you want to quit?'),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.color3,
            foregroundColor: AppColor.color3,
            side: const BorderSide(
              color: AppColor.color3,
            ),
          ),
          onPressed: tapNo,
          child: const Text(
            "No",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColor.color3,
            side: const BorderSide(
              color: AppColor.color3,
            ),
          ),
          onPressed: tapYes,
          child: const Text("Yes"),
        ),
      ],
    );
  }
}
