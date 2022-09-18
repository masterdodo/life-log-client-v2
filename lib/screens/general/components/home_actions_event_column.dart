import 'package:flutter/material.dart';

import 'package:life_log_client_v2/screens/general/components/input_log_row.dart';
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

import 'package:life_log_client_v2/constants.dart' as Constants;

class EventActions extends StatelessWidget {
  const EventActions({Key? key}) : super(key: key);
// EVENT ACTIONS
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: Constants.eventsActionsTitle),
        Wrap(children: const [
          InputLogAction(
            name: "Special Day",
            category: "Journal:Events:Special Day",
            descriptionField: false,
            valueUnitFields: false,
            preName: "",
            oneTimeEvent: true,
          ),
        ]),
      ],
    );
  }
}
