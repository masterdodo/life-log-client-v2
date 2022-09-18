import 'package:flutter/material.dart';

import 'package:life_log_client_v2/screens/general/components/input_log_row.dart';
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

import 'package:life_log_client_v2/constants.dart' as Constants;

class WorkActions extends StatefulWidget {
  const WorkActions({Key? key}) : super(key: key);

  @override
  State<WorkActions> createState() => _WorkActionsState();
}

class _WorkActionsState extends State<WorkActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: Constants.workActionsTitle),
        Wrap(
          children: const [
            /*LogButton(
                name: "HRC",
                category: "Work:Job",
                description: "HRC student work",
                isEndCall: false,
                textName: "HRC"),
            LogButton(
                name: "HRC",
                category: "",
                description: "",
                isEndCall: true,
                textName: "HRC End"),*/
          ],
        ),
        const InputLogAction(
          name: "Company",
          category: "Work:Job",
          descriptionField: false,
          valueUnitFields: false,
        ),
        const InputLogAction(
          name: "Hobby Programming",
          category: "Work:Hobby:Programming",
          descriptionField: true,
          descriptionHeight: 1,
          valueUnitFields: false,
        ),
        const InputLogAction(
          name: "Home work",
          category: "Work:Home:Improvement",
          descriptionField: true,
          descriptionHeight: 2,
          valueUnitFields: false,
        ),
      ],
    );
  }
}
