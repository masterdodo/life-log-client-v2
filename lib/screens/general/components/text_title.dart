import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 20,
            shadows: [
              Shadow(
                blurRadius: 12,
                color: Colors.grey,
                offset: Offset(2, 2),
              ),
            ],
            decoration: TextDecoration.overline));
  }
}
