import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/general.dart';
import 'package:life_log_client_v2/screens/general/components/app_drawer.dart';

import 'package:life_log_client_v2/screens/general/components/home_actions_custom_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_entertainment_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_health_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_sleep_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_work_column.dart';
import 'package:life_log_client_v2/constants.dart' as Constants;

class HomeActions extends StatefulWidget {
  const HomeActions({Key? key}) : super(key: key);

  static const String title = Constants.homeActionsTitle;
  static const String routeName = Constants.homeActionsRoute;

  @override
  State<HomeActions> createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActions> {
  bool _hasNetwork = false;

  @override
  void initState() {
    super.initState();
    hasNetwork().then((hasNetwork) {
      setState(() {
        _hasNetwork = hasNetwork;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(HomeActions.title),
      ),
      body: (_hasNetwork)
          ? Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        CustomAction(),
                        SleepActions(),
                        HealthActions(),
                        WorkActions(),
                        EntertainmentActions(),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text("No network connection"),
            ),
    );
  }
}
