import 'package:flutter/material.dart';

import 'package:life_log_client_v2/screens/general/components/log_button.dart';
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

class SleepActions extends StatelessWidget {
  const SleepActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: "Sleep"),
        Wrap(
          children: const [
            LogButton(
                name: "Bed",
                category: "Health:Sleep",
                description: "Went to bed",
                isEndCall: false,
                textName: "Went to bed"),
            LogButton(
                name: "Bed",
                category: "",
                description: "",
                isEndCall: true,
                textName: "Woke up"),
          ],
        ),
      ],
    );
  }
}
