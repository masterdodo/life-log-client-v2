import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/api.dart';

class LogButton extends StatefulWidget {
  final String name;
  final String category;
  final String description;
  final String textName;
  final DateTime? start;
  final DateTime? end;
  final String value;
  final String unit;
  final bool isEndCall;

  const LogButton(
      {Key? key,
      this.name = '',
      this.category = '',
      this.description = '',
      this.start,
      this.end,
      this.value = '',
      this.unit = '',
      this.isEndCall = false,
      this.textName = ''})
      : super(key: key);

  @override
  State<LogButton> createState() => _LogButtonState();
}

class _LogButtonState extends State<LogButton> {
  TextEditingController specificLog = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: TextButton(
        /*show buttons on long press*/
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(widget.name),
                  content: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(widget.description),
                      ),
                      const Text("Specific:"),
                      TextField(
                        controller: specificLog,
                        decoration: const InputDecoration(
                          labelText: 'Specific',
                        ),
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Specific Call'),
                      onPressed: () async {
                        if (specificLog.text.isEmpty) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 179, 99, 25),
                            content: const Text("Specific field is empty."),
                            duration: const Duration(seconds: 3),
                          ));
                          return;
                        }
                        List<dynamic> responseArr = await insertLog(
                            widget.name + ":" + specificLog.text,
                            widget.category,
                            widget.description,
                            widget.start,
                            widget.end,
                            widget.value,
                            widget.unit,
                            false);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: responseArr[0] == 200
                              ? const Color.fromARGB(255, 75, 138, 77)
                              : (responseArr[0] == 500
                                  ? const Color.fromARGB(255, 180, 59, 51)
                                  : const Color.fromARGB(255, 179, 99, 25)),
                          content: Text(responseArr[1]),
                          duration: Duration(
                              seconds: responseArr[0] == 200
                                  ? 1
                                  : (responseArr[0] == 500 ? 5 : 2)),
                        ));
                      },
                    ),
                    TextButton(
                      child: const Text('End Call'),
                      onPressed: () async {
                        String combinedName = widget.name;
                        if (!specificLog.text.isEmpty) {
                          combinedName += ":" + specificLog.text;
                        }
                        List<dynamic> responseArr = await insertLog(
                            combinedName,
                            widget.category,
                            widget.description,
                            widget.start,
                            widget.end,
                            widget.value,
                            widget.unit,
                            true);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: responseArr[0] == 200
                              ? const Color.fromARGB(255, 75, 138, 77)
                              : (responseArr[0] == 500
                                  ? const Color.fromARGB(255, 180, 59, 51)
                                  : const Color.fromARGB(255, 179, 99, 25)),
                          content: Text(responseArr[1]),
                          duration: Duration(
                              seconds: responseArr[0] == 200
                                  ? 1
                                  : (responseArr[0] == 500 ? 5 : 2)),
                        ));
                      },
                    ),
                  ],
                );
              });
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        ),
        onPressed: () async {
          List<dynamic> responseArr = await insertLog(
              widget.name,
              widget.category,
              widget.description,
              widget.start,
              widget.end,
              widget.value,
              widget.unit,
              widget.isEndCall);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: responseArr[0] == 200
                ? const Color.fromARGB(255, 75, 138, 77)
                : (responseArr[0] == 500
                    ? const Color.fromARGB(255, 180, 59, 51)
                    : const Color.fromARGB(255, 179, 99, 25)),
            content: Text(responseArr[1]),
            duration: Duration(
                seconds: responseArr[0] == 200
                    ? 1
                    : (responseArr[0] == 500 ? 5 : 2)),
          ));
        },
        child: Text(widget.textName),
      ),
    );
  }
}
