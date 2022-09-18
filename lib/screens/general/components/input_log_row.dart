import 'package:flutter/material.dart';
import 'package:life_log_client_v2/methods/api.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InputLogAction extends StatefulWidget {
  final String name;
  final String category;
  final bool descriptionField;
  final int? descriptionHeight;
  final bool valueUnitFields;
  final String preName;
  final bool oneTimeEvent;

  const InputLogAction(
      {Key? key,
      required this.name,
      required this.category,
      required this.descriptionField,
      this.descriptionHeight,
      required this.valueUnitFields,
      this.preName = "",
      this.oneTimeEvent = false})
      : super(key: key);

  @override
  State<InputLogAction> createState() => _InputLogActionState();
}

class _InputLogActionState extends State<InputLogAction> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nameController.text = widget.preName;
    });
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  SnackBar buildSnackbar(List<dynamic> responseArr) {
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

  void clearFields() {
    setState(() {
      _nameController.text = widget.preName;
      _descriptionController.text = '';
      _valueController.text = '';
      _unitController.text = '';
    });
  }

  Future<List<dynamic>> insertLogResponse(bool endCall) async {
    return await insertLog(
        _nameController.text,
        widget.category,
        _descriptionController.text,
        null,
        null,
        _valueController.text,
        _unitController.text,
        endCall);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed:
                // If not yet listening for speech start, otherwise stop
                _speechToText.isNotListening ? _startListening : _stopListening,
            child:
                Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              // If listening is active show the recognized words
              _speechToText.isListening
                  ? _lastWords
                  : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: widget.name,
                  ),
                ),
              ),
              (widget.oneTimeEvent)
                  ? TextButton(
                      onPressed: () {},
                      child: TextButton(
                        onPressed: () async {
                          List<dynamic> responseArr =
                              await insertLogResponse(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            buildSnackbar(responseArr),
                          );
                          clearFields();
                        },
                        child: const Text('Submit'),
                      ))
                  : Row(
                      children: [
                        TextButton(
                          onPressed: () async {
                            List<dynamic> responseArr =
                                await insertLogResponse(false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              buildSnackbar(responseArr),
                            );
                          },
                          child: const Text('Start'),
                        ),
                        TextButton(
                          onPressed: () async {
                            List<dynamic> responseArr =
                                await insertLogResponse(true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              buildSnackbar(responseArr),
                            );
                            clearFields();
                          },
                          child: const Text('End'),
                        ),
                      ],
                    ),
            ],
          ),
          if (widget.descriptionField)
            TextField(
              controller: _descriptionController,
              maxLines: widget.descriptionHeight ?? 1,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
          if (widget.valueUnitFields)
            Row(
              children: [
                TextField(
                  controller: _valueController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Value',
                  ),
                ),
                TextField(
                  controller: _unitController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
