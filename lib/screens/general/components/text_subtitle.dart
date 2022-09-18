import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  final String text;
  const TextSubtitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        shadows: [
          Shadow(
            blurRadius: 6,
            color: Colors.grey,
            offset: Offset(1, 1),
          ),
        ],
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
