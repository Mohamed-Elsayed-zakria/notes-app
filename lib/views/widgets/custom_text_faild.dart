import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class CustomTextFaild extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final int maxLines;
  const CustomTextFaild({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (controller?.text.isEmpty ?? true) {
            return 'Faild is required';
          } else {
            return null;
          }
        },
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: title,
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor),
          ),
        ),
      ),
    );
  }
}
