import 'package:flutter/material.dart';

import 'package:life_log_client_v2/screens/general/components/log_button.dart';
import 'package:life_log_client_v2/screens/general/components/input_log_row.dart';
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

import 'package:life_log_client_v2/constants.dart' as Constants;

class JournalActions extends StatelessWidget {
  const JournalActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: Constants.journalActionsTitle),
        Wrap(children: const [
          InputLogAction(
            name: "Note",
            category: "Journal:Notes",
            descriptionField: true,
            descriptionHeight: 4,
            valueUnitFields: false,
            preName: "Note",
            oneTimeEvent: true,
          ),
          InputLogAction(
            name: "Moment",
            category: "Journal:Moments",
            descriptionField: true,
            descriptionHeight: 3,
            valueUnitFields: false,
            preName: "Moment",
            oneTimeEvent: true,
          ),
          LogButton(
              name: "Worst",
              category: "Journal:Mood",
              description: "I'm feeling absolute shit",
              isEndCall: false,
              textName: "Worst"),
          LogButton(
              name: "Quite bad",
              category: "Journal:Mood",
              description:
                  "I'm feeling quite bad, but it could be a little worse",
              isEndCall: false,
              textName: "Pretty bad"),
          LogButton(
              name: "Bad",
              category: "Journal:Mood",
              description: "I'm feeling bad",
              isEndCall: false,
              textName: "Bad"),
          LogButton(
              name: "Okay",
              category: "Journal:Mood",
              description: "I'm feeling okay",
              isEndCall: false,
              textName: "Okay"),
          LogButton(
              name: "Good",
              category: "Journal:Mood",
              description: "I'm feeling good",
              isEndCall: false,
              textName: "Good"),
          LogButton(
              name: "Really good",
              category: "Journal:Mood",
              description:
                  "I'm feeling really good, but it could be a little better",
              isEndCall: false,
              textName: "Really good"),
          LogButton(
              name: "Amazing",
              category: "Journal:Mood",
              description: "I'm feeling amazing",
              isEndCall: false,
              textName: "Amazing"),
        ]),
      ],
    );
  }
}
