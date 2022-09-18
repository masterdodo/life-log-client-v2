import 'package:flutter/material.dart';

import 'package:life_log_client_v2/screens/general/components/input_log_row.dart';
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

import 'package:life_log_client_v2/constants.dart' as Constants;

class SocialActions extends StatelessWidget {
  const SocialActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: Constants.socialActionsTitle),
        Wrap(
          children: const [
            InputLogAction(
              name: "Person (first)",
              category: "Social:People:First",
              descriptionField: true,
              descriptionHeight: 3,
              valueUnitFields: false,
              oneTimeEvent: true,
            ),
            InputLogAction(
              name: "Person (convo)",
              category: "Social:People:Conversations",
              descriptionField: true,
              descriptionHeight: 4,
              valueUnitFields: false,
              oneTimeEvent: true,
            ),
          ],
        ),
      ],
    );
  }
}
