import 'package:flutter/material.dart';
import 'package:life_log_client_v2/constants.dart' as Constants;

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: const EdgeInsets.only(top: 40.0), children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          Constants.appName,
          style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.recentLogsRoute),
        title: const Text(Constants.recentLogsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.recentLogsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.homeActionsRoute),
        title: const Text(Constants.homeActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.homeActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.healthActionsRoute),
        title: const Text(Constants.healthActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.healthActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.workActionsRoute),
        title: const Text(Constants.workActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.workActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.entertainmentActionsRoute),
        title: const Text(Constants.entertainmentActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
              context, Constants.entertainmentActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.journalActionsRoute),
        title: const Text(Constants.journalActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
              context, Constants.journalActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.socialActionsRoute),
        title: const Text(Constants.socialActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.socialActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.eventsActionsRoute),
        title: const Text(Constants.eventsActionsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.eventsActionsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.recentStatsRoute),
        title: const Text(Constants.recentStatsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.recentStatsRoute);
        },
      ),
      ListTile(
        selected: (ModalRoute.of(context)?.settings.name ==
            Constants.rangeStatsRoute),
        title: const Text(Constants.rangeStatsTitle),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Constants.rangeStatsRoute);
        },
      ),
    ]));
  }
}
