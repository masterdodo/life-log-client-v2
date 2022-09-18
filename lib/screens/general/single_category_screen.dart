import 'package:flutter/material.dart';
import 'package:life_log_client_v2/screens/general/components/app_drawer.dart';

class SingleCategory extends StatefulWidget {
  final Widget outputWidget;
  final String title;
  final String routeName;

  const SingleCategory(
      {Key? key,
      required this.outputWidget,
      required this.title,
      required this.routeName})
      : super(key: key);

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  widget.outputWidget,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
