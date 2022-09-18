import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:life_log_client_v2/methods/api.dart';
import 'package:life_log_client_v2/models/log.dart';
import 'package:life_log_client_v2/screens/general/components/app_drawer.dart';

class RecentLogs extends StatefulWidget {
  const RecentLogs({Key? key}) : super(key: key);

  @override
  State<RecentLogs> createState() => _RecentLogsState();
}

class _RecentLogsState extends State<RecentLogs> {
  List<Log> logs = [];
  int _timeSlideMins = 20;
  String _timeSlideUnit = "minutes";

  @override
  void initState() {
    super.initState();
    getLogs();
  }

  Future getLogs() async {
    List<dynamic> responseArr = await getRecentLogs(2);
    final List<dynamic> dataArr = jsonDecode(responseArr[1]);
    List<Log> logs = [];
    for (dynamic element in dataArr) {
      logs.add(Log.fromJson(element));
    }
    setState(() {
      this.logs = logs;
    });
  }

  Future updateLogResponse(int? id, String type, bool up) async {
    List<dynamic> responseArr = await updateLogTime(
        id ?? 0,
        type,
        _timeSlideUnit == "hours"
            ? _timeSlideMins.toInt() * 60
            : _timeSlideMins.toInt(),
        up);
    return responseArr;
  }

  String getTopCategory(Log log) {
    return log.category?.split(':')[0] ?? "";
  }

  Color getCategoryColor(String category) {
    if (category.isEmpty) {
      return const Color.fromARGB(0, 0, 0, 0);
    }

    if (category == "Entertainment") {
      return const Color.fromARGB(128, 223, 171, 29);
    }

    if (category == "Health") {
      return const Color.fromARGB(128, 29, 223, 71);
    }

    if (category == "Work") {
      return const Color.fromARGB(128, 21, 95, 198);
    }

    if (category == "Journal") {
      return const Color.fromARGB(128, 90, 48, 216);
    }

    if (category == "Logging") {
      return const Color.fromARGB(128, 158, 158, 158);
    }

    return const Color.fromARGB(0, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Recent Logs"),
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
                      child: Text("Recent Logs",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    for (final log in logs)
                      GestureDetector(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(log.name ?? ""),
                                  content: StatefulBuilder(
                                    builder: (context, setStateDialog) =>
                                        Column(
                                      children: [
                                        Text(log.description ?? ""),
                                        Center(
                                            child: Text(
                                                _timeSlideMins.toString())),
                                        Slider(
                                          divisions: 59,
                                          min: 1.0,
                                          max: 60.0,
                                          value: _timeSlideMins.toDouble(),
                                          onChanged: (value) {
                                            setStateDialog(() {
                                              _timeSlideMins = value.toInt();
                                            });
                                          },
                                        ),
                                        //Add a dropdown widget
                                        DropdownButton<String>(
                                          value: _timeSlideUnit,
                                          items: const [
                                            DropdownMenuItem<String>(
                                              value: "minutes",
                                              child: Text("Minutes"),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "hours",
                                              child: Text("Hours"),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setStateDialog(() {
                                              _timeSlideUnit = value!;
                                            });
                                          },
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  child: const Text(
                                                      'Start Earlier'),
                                                  onPressed: () async {
                                                    List<dynamic> responseArr =
                                                        await updateLogResponse(
                                                            log.id,
                                                            "start",
                                                            true);
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      backgroundColor: responseArr[
                                                                  0] ==
                                                              200
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              75, 138, 77)
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  59,
                                                                  51)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  179,
                                                                  99,
                                                                  25)),
                                                      content:
                                                          Text(responseArr[1]),
                                                      duration: Duration(
                                                          seconds: responseArr[
                                                                      0] ==
                                                                  200
                                                              ? 1
                                                              : (responseArr[
                                                                          0] ==
                                                                      500
                                                                  ? 5
                                                                  : 2)),
                                                    ));
                                                    getLogs();
                                                  },
                                                ),
                                                TextButton(
                                                  child:
                                                      const Text('End Earlier'),
                                                  onPressed: () async {
                                                    List<dynamic> responseArr =
                                                        await updateLogResponse(
                                                            log.id,
                                                            "end",
                                                            true);
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      backgroundColor: responseArr[
                                                                  0] ==
                                                              200
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              75, 138, 77)
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  59,
                                                                  51)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  179,
                                                                  99,
                                                                  25)),
                                                      content:
                                                          Text(responseArr[1]),
                                                      duration: Duration(
                                                          seconds: responseArr[
                                                                      0] ==
                                                                  200
                                                              ? 1
                                                              : (responseArr[
                                                                          0] ==
                                                                      500
                                                                  ? 5
                                                                  : 2)),
                                                    ));
                                                    getLogs();
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                    child: const Text(
                                                        'Both Earlier'),
                                                    onPressed: () async {
                                                      List<dynamic>
                                                          responseArr =
                                                          await updateLogResponse(
                                                              log.id,
                                                              "startend",
                                                              true);
                                                      Navigator.of(context)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(24),
                                                        ),
                                                        backgroundColor: responseArr[
                                                                    0] ==
                                                                200
                                                            ? const Color
                                                                    .fromARGB(
                                                                255,
                                                                75,
                                                                138,
                                                                77)
                                                            : (responseArr[0] ==
                                                                    500
                                                                ? const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    180,
                                                                    59,
                                                                    51)
                                                                : const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    179,
                                                                    99,
                                                                    25)),
                                                        content: Text(
                                                            responseArr[1]),
                                                        duration: Duration(
                                                            seconds: responseArr[
                                                                        0] ==
                                                                    200
                                                                ? 1
                                                                : (responseArr[
                                                                            0] ==
                                                                        500
                                                                    ? 5
                                                                    : 2)),
                                                      ));
                                                      getLogs();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                TextButton(
                                                  child:
                                                      const Text('Start Later'),
                                                  onPressed: () async {
                                                    List<dynamic> responseArr =
                                                        await updateLogResponse(
                                                            log.id,
                                                            "start",
                                                            false);
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      backgroundColor: responseArr[
                                                                  0] ==
                                                              200
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              75, 138, 77)
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  59,
                                                                  51)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  179,
                                                                  99,
                                                                  25)),
                                                      content:
                                                          Text(responseArr[1]),
                                                      duration: Duration(
                                                          seconds: responseArr[
                                                                      0] ==
                                                                  200
                                                              ? 1
                                                              : (responseArr[
                                                                          0] ==
                                                                      500
                                                                  ? 5
                                                                  : 2)),
                                                    ));
                                                    getLogs();
                                                  },
                                                ),
                                                TextButton(
                                                  child:
                                                      const Text('End Later'),
                                                  onPressed: () async {
                                                    List<dynamic> responseArr =
                                                        await updateLogResponse(
                                                            log.id,
                                                            "end",
                                                            false);
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      backgroundColor: responseArr[
                                                                  0] ==
                                                              200
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              75, 138, 77)
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  59,
                                                                  51)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  179,
                                                                  99,
                                                                  25)),
                                                      content:
                                                          Text(responseArr[1]),
                                                      duration: Duration(
                                                          seconds: responseArr[
                                                                      0] ==
                                                                  200
                                                              ? 1
                                                              : (responseArr[
                                                                          0] ==
                                                                      500
                                                                  ? 5
                                                                  : 2)),
                                                    ));
                                                    getLogs();
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                  child:
                                                      const Text('Both Later'),
                                                  onPressed: () async {
                                                    List<dynamic> responseArr =
                                                        await updateLogResponse(
                                                            log.id,
                                                            "startend",
                                                            false);
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                      backgroundColor: responseArr[
                                                                  0] ==
                                                              200
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              75, 138, 77)
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  59,
                                                                  51)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  179,
                                                                  99,
                                                                  25)),
                                                      content:
                                                          Text(responseArr[1]),
                                                      duration: Duration(
                                                          seconds: responseArr[
                                                                      0] ==
                                                                  200
                                                              ? 1
                                                              : (responseArr[
                                                                          0] ==
                                                                      500
                                                                  ? 5
                                                                  : 2)),
                                                    ));
                                                    getLogs();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Delete'),
                                              onPressed: () async {
                                                List<dynamic> responseArr =
                                                    await deleteLog(
                                                        log.id ?? -1);
                                                Navigator.of(context).pop();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  backgroundColor:
                                                      responseArr[0] == 200
                                                          ? const Color
                                                                  .fromARGB(255,
                                                              75, 138, 77)
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  180,
                                                                  59,
                                                                  51)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  179,
                                                                  99,
                                                                  25)),
                                                  content: Text(responseArr[1]),
                                                  duration: Duration(
                                                      seconds: responseArr[0] ==
                                                              200
                                                          ? 1
                                                          : (responseArr[0] ==
                                                                  500
                                                              ? 5
                                                              : 2)),
                                                ));
                                                getLogs();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: getCategoryColor(getTopCategory(log)),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  spreadRadius: 3),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(log.name ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Text(log.description ?? ""),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    (log.end == null
                                        ? Text(log.start != null
                                            ? DateFormat('d MMM HH:mm').format(
                                                log.start ?? DateTime.now())
                                            : "")
                                        : Text(log.start != null
                                            ? DateFormat('d MMM HH:mm').format(
                                                    log.start ??
                                                        DateTime.now()) +
                                                " - " +
                                                DateFormat('d MMM HH:mm')
                                                    .format(log.end ??
                                                        DateTime.now())
                                            : "")),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
