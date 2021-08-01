import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String labelTitle;

  const TextLabel({Key? key, required this.labelTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      labelTitle,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
