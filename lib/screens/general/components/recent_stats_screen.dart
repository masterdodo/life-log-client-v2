import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/api.dart';
import 'package:life_log_client_v2/models/appStat.dart';
import 'package:life_log_client_v2/screens/general/components/app_drawer.dart';

class RecentStats extends StatefulWidget {
  const RecentStats({Key? key}) : super(key: key);

  @override
  State<RecentStats> createState() => _RecentStatsState();
}

class _RecentStatsState extends State<RecentStats> {
  List<AppStat> appsStats = [];

  @override
  void initState() {
    super.initState();
    getStats();
  }

  Future getStats() async {
    List<dynamic> responseArr = await getRecentStats(7);
    final List<dynamic> dataArr = jsonDecode(responseArr[1]);
    List<AppStat> appStats = [];
    for (dynamic element in dataArr) {
      appStats.add(AppStat.fromJson(element));
    }
    setState(() {
      appsStats = appStats;
    });
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
                      child: Text("Recent Stats",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
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
