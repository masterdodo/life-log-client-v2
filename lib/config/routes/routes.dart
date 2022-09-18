import 'package:flutter/material.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_entertainment_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_event_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_journal_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_social_column.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_work_column.dart';
import 'package:life_log_client_v2/screens/general/components/range_stats_screen.dart';
import 'package:life_log_client_v2/screens/general/components/recent_logs_screen.dart';
import 'package:life_log_client_v2/screens/general/components/recent_stats_screen.dart';
import 'package:life_log_client_v2/screens/general/single_category_screen.dart';
import 'package:life_log_client_v2/screens/general/components/home_actions_health_column.dart';
import 'package:life_log_client_v2/screens/general/home_actions_screen.dart';
// import constants
import 'package:life_log_client_v2/constants.dart' as Constants;

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home-actions': (BuildContext context) => const HomeActions(),
  '/health-actions': (BuildContext context) => const SingleCategory(
      outputWidget: HealthActions(),
      title: Constants.healthActionsTitle,
      routeName: Constants.healthActionsRoute),
  '/work-actions': (BuildContext context) => const SingleCategory(
      outputWidget: WorkActions(),
      title: Constants.workActionsTitle,
      routeName: Constants.workActionsRoute),
  '/entertainment-actions': (BuildContext context) => const SingleCategory(
      outputWidget: EntertainmentActions(),
      title: Constants.entertainmentActionsTitle,
      routeName: Constants.entertainmentActionsRoute),
  '/recent-logs': (BuildContext context) => const RecentLogs(),
  '/journal-actions': (BuildContext context) => const SingleCategory(
      outputWidget: JournalActions(),
      title: Constants.journalActionsTitle,
      routeName: Constants.journalActionsRoute),
  '/social-actions': (BuildContext context) => const SingleCategory(
      outputWidget: SocialActions(),
      title: Constants.socialActionsTitle,
      routeName: Constants.socialActionsRoute),
  '/event-actions': (BuildContext context) => const SingleCategory(
      outputWidget: EventActions(),
      title: Constants.eventsActionsTitle,
      routeName: Constants.eventsActionsRoute),
  '/recent-stats': (BuildContext context) => const RecentStats(),
  '/range-stats': (BuildContext context) => const RangeStats()
};
