import 'package:flutter/material.dart';
import 'package:life_log_client_v2/models/clientLog.dart';

import 'package:life_log_client_v2/screens/general/components/log_button.dart';
import 'package:life_log_client_v2/screens/general/components/package_button.dart';
import 'package:life_log_client_v2/screens/general/components/text_subtitle.dart';
import 'package:life_log_client_v2/screens/general/components/text_title.dart';

import 'package:life_log_client_v2/constants.dart' as Constants;

class HealthActions extends StatelessWidget {
  const HealthActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextTitle(text: Constants.healthActionsTitle),
        Wrap(children: const [
          LogButton(
              name: "Brush",
              category: "Health:Hygiene:Teeth",
              description: "Brushing teeth",
              isEndCall: false,
              textName: "Brush Teeth"),
          LogButton(
              name: "Wash",
              category: "Health:Hygiene:Face",
              description: "Washing face",
              isEndCall: false,
              textName: "Wash Face"),
          LogButton(
              name: "Wash",
              category: "Health:Hygiene:Body",
              description: "Washing body",
              isEndCall: false,
              textName: "Body shower"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Cut Nails",
              category: "Health:Hygiene:Body",
              description: "Cutting nails",
              isEndCall: false,
              textName: "Cut Nails"),
          LogButton(
              name: "Cut Toenails",
              category: "Health:Hygiene:Body",
              description: "Cutting toenails",
              isEndCall: false,
              textName: "Cut Toenails"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Pee",
              category: "Health:Hygiene:Body",
              description: "Peeing",
              isEndCall: false,
              textName: "Pee"),
          LogButton(
              name: "Shart",
              category: "Health:Hygiene:Body",
              description: "Between pee and poo",
              isEndCall: false,
              textName: "Shart"),
          LogButton(
              name: "Poo",
              category: "Health:Hygiene:Body",
              description: "Pooping",
              isEndCall: false,
              textName: "Poo"),
        ]),
        const TextSubtitle(text: "Consumption"),
        Wrap(
          children: const [
            LogButton(
                name: "Breakfast",
                category: "Health:Physical:Diet:Consumption",
                description: "Ate breakfast",
                isEndCall: false,
                textName: "Breakfast"),
            LogButton(
                name: "Lunch",
                category: "Health:Physical:Diet:Consumption",
                description: "Ate lunch",
                isEndCall: false,
                textName: "Lunch"),
            LogButton(
                name: "Dinner",
                category: "Health:Physical:Diet:Consumption",
                description: "Ate dinner",
                isEndCall: false,
                textName: "Dinner"),
          ],
        ),
        Wrap(children: const [
          LogButton(
              name: "Coffee",
              category: "Health:Physical:Diet:Consumption",
              description: "Drank coffee",
              isEndCall: false,
              textName: "Coffee"),
          LogButton(
              name: "Tea",
              category: "Health:Physical:Diet:Consumption",
              description: "Drank tea",
              isEndCall: false,
              textName: "Tea"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Post Workout Meal",
              category: "Health:Physical:Diet:Consumption",
              description: "Ate post workout meal",
              isEndCall: false,
              textName: "Post Workout Meal"),
          LogButton(
              name: "Smoothie",
              category: "Health:Physical:Diet:Consumption",
              description: "Consumed a smoothie",
              isEndCall: false,
              textName: "Smoothie"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Protein Shake",
              category: "Health:Physical:Diet:Consumption",
              description: "Drank a protein shake (25g)",
              isEndCall: false,
              textName: "Protein Shake"),
          LogButton(
              name: "Protein Bar",
              category: "Health:Physical:Diet:Consumption",
              description: "Ate a protein bar",
              isEndCall: false,
              textName: "Protein Bar"),
        ]),
        Wrap(children: [
          const LogButton(
              name: "B",
              category: "Health:Physical:Diet:Consumption:Vitamin",
              description: "Consumed vitamin B",
              isEndCall: false,
              textName: "Vitamin B"),
          const LogButton(
              name: "D",
              category: "Health:Physical:Diet:Consumption:Vitamin",
              description: "Consumed vitamin D",
              isEndCall: false,
              textName: "Vitamin D"),
          PackageButton(
            packageName: "Vitamin D3 Krka",
            logs: [
              ClientLog(
                  "D",
                  "Health:Physical:Diet:Consumption:Vitamin",
                  "Consumed vitamin D - D3 Krka",
                  null,
                  null,
                  "25",
                  "qg",
                  false,
                  "Vitamin D")
            ],
          )
        ]),
        Wrap(children: [
          const LogButton(
              name: "Electrolytes",
              category: "Health:Physical:Diet:Consumption",
              description: "Consumed Electrolytes",
              isEndCall: false,
              textName: "Electrolytes"),
          const LogButton(
              name: "Magnesium",
              category: "Health:Physical:Diet:Consumption:Mineral",
              description: "Consumed Magnesium",
              isEndCall: false,
              textName: "Magnesium"),
          const LogButton(
              name: "Zinc",
              category: "Health:Physical:Diet:Consumption:Mineral",
              description: "Consumed Zinc",
              isEndCall: false,
              textName: "Zinc"),
          PackageButton(packageName: "Valens Zinc", logs: [
            ClientLog("Zinc", "Health:Physical:Diet:Consumption:Mineral",
                "5 mg", null, null, "5", "mg", false, "Zinc"),
            ClientLog("B6", "Health:Physical:Diet:Consumption:Vitamin",
                "1,4 mg", null, null, "1.4", "mg", false, "Vitamin B6"),
            ClientLog("C", "Health:Physical:Diet:Consumption:Vitamin", "20 mg",
                null, null, "20", "mg", false, "Vitamin C"),
            ClientLog("D", "Health:Physical:Diet:Consumption:Vitamin", "20 qg",
                null, null, "20", "qg", false, "Vitamin D"),
            ClientLog("E", "Health:Physical:Diet:Consumption:Vitamin", "4 mg",
                null, null, "4", "mg", false, "Vitamin E")
          ])
        ]),
        Wrap(children: const [
          LogButton(
              name: "BCAA",
              category: "Health:Physical:Diet:Consumption",
              description: "Consumed BCAA (10g)",
              isEndCall: false,
              textName: "BCAA"),
          LogButton(
              name: "BCAA + Creatine",
              category: "Health:Physical:Diet:Consumption",
              description: "Consumed BCAA + Creatine (10g + 5g)",
              isEndCall: false,
              textName: "BCAA + Creatine"),
          LogButton(
              name: "Creatine",
              category: "Health:Physical:Diet:Consumption",
              description: "Consumed Creatine (5g)",
              isEndCall: false,
              textName: "Creatine"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Snack",
              category: "Health:Physical:Diet:Consumption",
              description: "Ate snack",
              isEndCall: false,
              textName: "Snack"),
          LogButton(
              name: "Healthy",
              category: "Health:Physical:Diet:Consumption:Snack",
              description: "Ate a healthy snack",
              isEndCall: false,
              textName: "Healthy Snack"),
          LogButton(
              name: "Fruit",
              category: "Health:Physical:Diet:Consumption:Snack",
              description: "Ate a fruit snack",
              isEndCall: false,
              textName: "Fruit Snack"),
          LogButton(
              name: "Vegetables",
              category: "Health:Physical:Diet:Consumption:Snack",
              description: "Ate a vegetable snack",
              isEndCall: false,
              textName: "Vegetables Snack"),
          LogButton(
              name: "Nut",
              category: "Health:Physical:Diet:Consumption:Snack",
              description: "Ate a nut snack",
              isEndCall: false,
              textName: "Nut Snack"),
        ]),
        Wrap(
          children: const [
            LogButton(
                name: "Shit",
                category: "Health:Physical:Diet:Consumption:Snack",
                description: "Ate a shitty snack",
                isEndCall: false,
                textName: "Shit Snack"),
            LogButton(
                name: "Fast food",
                category: "Health:Physical:Diet:Consumption",
                description: "Ate fast food",
                isEndCall: false,
                textName: "Fast food"),
          ],
        ),
        const TextSubtitle(text: "Exercise"),
        Wrap(children: const [
          LogButton(
              name: "Full Body",
              category: "Health:Physical:Gym:Strength",
              description: "Full Body Workout",
              isEndCall: false,
              textName: "Full Body Gym"),
          LogButton(
              name: "Full Body",
              category: "Health:Physical:Home:Strength",
              description: "Full Body Workout",
              isEndCall: false,
              textName: "Full Body Home"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Legs",
              category: "Health:Physical:Gym:Strength",
              description: "",
              isEndCall: false,
              textName: "Legs Gym"),
          LogButton(
              name: "Push",
              category: "Health:Physical:Gym:Strength",
              description: "Chest, Triceps, Shoulders",
              isEndCall: false,
              textName: "Push Gym"),
          LogButton(
              name: "Pull",
              category: "Health:Physical:Gym:Strength",
              description: "Back, Biceps",
              isEndCall: false,
              textName: "Pull Gym"),
        ]),
        Wrap(
          children: const [
            LogButton(
                name: "Legs",
                category: "Health:Physical:Home:Strength",
                description: "",
                isEndCall: false,
                textName: "Legs Home"),
            LogButton(
                name: "Push",
                category: "Health:Physical:Home:Strength",
                description: "",
                isEndCall: false,
                textName: "Push Home"),
            LogButton(
                name: "Pull",
                category: "Health:Physical:Home:Strength",
                description: "",
                isEndCall: false,
                textName: "Pull Home"),
          ],
        ),
        Wrap(children: const [
          LogButton(
              name: "Abs",
              category: "Health:Physical:Gym:Strength",
              description: "",
              isEndCall: false,
              textName: "Abs Gym"),
          LogButton(
              name: "Abs",
              category: "Health:Physical:Home:Strength",
              description: "",
              isEndCall: false,
              textName: "Abs Home"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Cardio",
              category: "Health:Physical:Gym",
              description: "",
              isEndCall: false,
              textName: "Cardio Gym"),
          LogButton(
              name: "Cardio",
              category: "Health:Physical:Home",
              description: "",
              isEndCall: false,
              textName: "Cardio Home"),
        ]),
        Wrap(children: const [
          LogButton(
              name: "Bike",
              category: "Health:Physical:Outdoor:Cardio",
              description: "Bike ride outside",
              isEndCall: false,
              textName: "Bike Outside"),
          LogButton(
              name: "Run",
              category: "Health:Physical:Outdoor:Cardio",
              description: "Run outside",
              isEndCall: false,
              textName: "Run Outside"),
          LogButton(
              name: "Walk",
              category: "Health:Physical:Outdoor:Cardio",
              description: "Walk outside",
              isEndCall: false,
              textName: "Walk Outside"),
        ]),
      ],
    );
  }
}
