import 'package:flutter/material.dart';

import 'package:life_log_client_v2/screens/general/components/log_button.dart';
import 'package:life_log_client_v2/screens/general/components/input_log_row.dart';

import 'package:life_log_client_v2/constants.dart' as Constants;
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

class EntertainmentActions extends StatefulWidget {
  const EntertainmentActions({Key? key}) : super(key: key);

  @override
  State<EntertainmentActions> createState() => _EntertainmentActionsState();
}

class _EntertainmentActionsState extends State<EntertainmentActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: Constants.entertainmentActionsTitle),
        Wrap(children: const [
          LogButton(
              name: "Youtube",
              category: "Entertainment:Web",
              description: "Watched Youtube",
              isEndCall: false,
              textName: "Youtube"),
          LogButton(
              name: "Twitch",
              category: "Entertainment:Web",
              description: "Watched Twitch",
              isEndCall: false,
              textName: "Twitch"),
        ]),
        const InputLogAction(
          name: 'Movie',
          category: 'Entertainment:Movies',
          descriptionField: false,
          valueUnitFields: false,
        ),
        const InputLogAction(
          name: 'TV Show',
          category: 'Entertainment:TVShows',
          descriptionField: false,
          valueUnitFields: false,
        ),
        const InputLogAction(
          name: 'Game',
          category: 'Entertainment:Games',
          descriptionField: false,
          valueUnitFields: false,
        ),
        const InputLogAction(
          name: 'Website',
          category: 'Entertainment:Web',
          descriptionField: false,
          valueUnitFields: false,
        ),
      ],
    );
  }
}
