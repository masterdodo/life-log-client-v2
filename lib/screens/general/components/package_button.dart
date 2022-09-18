import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/api.dart';
import 'package:life_log_client_v2/models/clientLog.dart';

class PackageButton extends StatefulWidget {
  final String packageName;
  final List<ClientLog>? logs;

  const PackageButton({Key? key, required this.packageName, this.logs})
      : super(key: key);

  @override
  State<PackageButton> createState() => _PackageButtonState();
}

class _PackageButtonState extends State<PackageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        ),
        onPressed: () async {
          widget.logs?.forEach((log) async {
            List<dynamic> responseArr = await insertLog(
                log.name ?? '',
                log.category ?? '',
                log.description ?? '',
                log.start,
                log.end,
                log.value,
                log.unit,
                log.isEndCall ?? false);
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
          });
        },
        child: Text(widget.packageName),
      ),
    );
  }
}
