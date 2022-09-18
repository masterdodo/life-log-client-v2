import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/api.dart';

class CustomAction extends StatefulWidget {
  const CustomAction({Key? key}) : super(key: key);

  @override
  State<CustomAction> createState() => _CustomActionState();
}

class _CustomActionState extends State<CustomAction> {
  //Add a text field for the name of the action.
  final _nameController = TextEditingController();
  //Add a text field for the category of the action.
  final _categoryController = TextEditingController();
  //Add a text field for the description of the action.
  final _descriptionController = TextEditingController();
  //Add checkbox for the type of action
  bool? _isEndCall = false;
  //Add a show/hide visibility boolean
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
            child: Column(children: <Widget>[
              CheckboxListTile(
                title: const Text('End Call'),
                value: _isEndCall,
                onChanged: (bool? value) {
                  setState(() {
                    _isEndCall = value;
                  });
                },
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              Row(
                children: [
                  TextButton(
                      child: const Text("Cancel"),
                      onPressed: () {
                        setState(() {
                          _isVisible = false;
                        });
                      }),
                  ElevatedButton(
                      child: const Text('Submit'),
                      onPressed: () {
                        callApi();
                        clearFields();
                      }),
                ],
              )
            ]),
            visible: _isVisible),
        Visibility(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: const Text("Show Custom Form")),
            visible: !_isVisible)
      ],
    );
  }

  void callApi() async {
    List<dynamic> responseArr = await insertLog(
        _nameController.text,
        _categoryController.text,
        _descriptionController.text,
        null,
        null,
        '',
        '',
        _isEndCall ?? false);
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
          seconds: responseArr[0] == 200 ? 1 : (responseArr[0] == 500 ? 5 : 2)),
    ));
  }

  void clearFields() {
    _nameController.clear();
    _categoryController.clear();
    _descriptionController.clear();
    setState(() {
      _isEndCall = false;
      _isVisible = false;
    });
  }
}
