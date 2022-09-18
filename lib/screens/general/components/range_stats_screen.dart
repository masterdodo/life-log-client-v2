import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/api.dart';
import 'package:life_log_client_v2/models/appStat.dart';
import 'package:life_log_client_v2/screens/general/components/app_drawer.dart';

class RangeStats extends StatefulWidget {
  const RangeStats({Key? key}) : super(key: key);

  @override
  State<RangeStats> createState() => _RangeStatsState();
}

class _RangeStatsState extends State<RangeStats> {
  DateTimeRange range = DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 2)),
      end: DateTime.now());
  List<AppStat> appsStats = [];

  @override
  void initState() {
    super.initState();
    getStats(null);
  }

  Future getStats(DateTimeRange? dateRange) async {
    range = DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 2)),
        end: DateTime.now());
    if (dateRange != null) {
      range = DateTimeRange(start: dateRange.start, end: dateRange.end);
    }
    List<dynamic> responseArr = await getRangeStats(
        range.start.toIso8601String().substring(0, 10),
        range.end.toIso8601String().substring(0, 10));
    final List<dynamic> dataArr = jsonDecode(responseArr[1]);
    List<AppStat> appStats = [];
    for (dynamic element in dataArr) {
      appStats.add(AppStat.fromJson(element));
    }
    setState(() {
      appsStats = appStats;
    });
  }

  String getMonthAbr(int mon) {
    switch (mon) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "...";
    }
  }

  String getDateHumanFormat(DateTime? dateToHuman) {
    if (dateToHuman == null) {
      return "/";
    }
    return dateToHuman.day.toString() +
        ". " +
        getMonthAbr(dateToHuman.month) +
        " " +
        dateToHuman.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Last Week Stats"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
                      child: Text("Range Stats",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  getDateHumanFormat(range.start),
                                  style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(" - "),
                                Text(
                                  getDateHumanFormat(range.end),
                                  style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          TextButton(
                              onPressed: () => showDateRangePicker(
                                      context: context,
                                      firstDate: DateTime.now()
                                          .subtract(const Duration(days: 365)),
                                      lastDate: DateTime.now())
                                  .then((value) => {getStats(value)}),
                              child: const Text("Choose Date Range"))
                        ],
                      ),
                    ),
                    for (final appStat in appsStats)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(appStat.name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text((appStat.minutes! > 60
                                ? ((appStat.minutes! ~/ 60).toString() +
                                    " h " +
                                    (appStat.minutes! -
                                            ((appStat.minutes! ~/ 60) * 60))
                                        .toString() +
                                    " min")
                                : (appStat.minutes.toString() + " min"))),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
