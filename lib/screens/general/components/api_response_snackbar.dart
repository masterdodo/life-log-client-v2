import 'package:flutter/material.dart';

class ApiResponseSnackbar extends StatelessWidget {
  final List<dynamic> responseArr;
  const ApiResponseSnackbar({Key? key, required this.responseArr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
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
          seconds: responseArr[0] == 200 ? 1 : (responseArr[0] == 500 ? 5 : 2)),
    );
  }
}
