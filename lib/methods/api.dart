import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:life_log_client_v2/constants.dart' as Constants;

Future<List<dynamic>> insertLog(
    String name,
    String category,
    String description,
    DateTime? start,
    DateTime? end,
    String value,
    String unit,
    bool isEndCall) async {
  String url = (isEndCall) ? Constants.logEndUrl : Constants.logUrl;

  Map<String, String> headers = {"Content-type": Constants.contentType};

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(<String, String>{
        'name': name,
        'category': category,
        'description': description,
        'start': (start != null) ? start.toIso8601String() : '',
        'end': isEndCall ? (end != null ? end.toIso8601String() : '') : "",
        'value': value,
        'unit': unit,
        'metadata_token': Constants.mobileToken,
        'auth_token': Constants.authToken,
      }),
    );
    return [response.statusCode, response.body];
  } catch (e) {
    return [500, e.toString()];
  }
}

Future<List<dynamic>> getRecentLogs(int days) async {
  String url = Constants.recentLogUrl + "/$days";

  Map<String, String> headers = {"Content-type": Constants.contentType};

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(<String, String>{
        'metadata_token': Constants.mobileToken,
        'auth_token': Constants.authToken,
      }),
    );
    return [response.statusCode, response.body];
  } catch (e) {
    return [500, e.toString()];
  }
}

Future<List<dynamic>> deleteLog(int id) async {
  String url = Constants.logUrl + "/$id";

  Map<String, String> headers = {"Content-type": Constants.contentType};

  try {
    var response = await http.delete(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(<String, String>{
        'metadata_token': Constants.mobileToken,
        'auth_token': Constants.authToken,
      }),
    );
    return [response.statusCode, response.body];
  } catch (e) {
    return [500, e.toString()];
  }
}

Future<List<dynamic>> updateLogTime(
    int id, String type, int mins, bool up) async {
  String url = Constants.logUrl + "/$id";

  Map<String, String> headers = {"Content-type": Constants.contentType};

  try {
    var response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(<String, String>{
        type: (up ? "-" : "") + mins.toString(),
        'metadata_token': Constants.mobileToken,
        'auth_token': Constants.authToken,
      }),
    );
    return [response.statusCode, response.body];
  } catch (e) {
    return [500, e.toString()];
  }
}

Future<List<dynamic>> getRecentStats(int days) async {
  String url = Constants.recentStatsUrl + "/$days";

  Map<String, String> headers = {"Content-type": Constants.contentType};

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(<String, String>{
        'metadata_token': Constants.mobileToken,
        'auth_token': Constants.authToken,
      }),
    );
    return [response.statusCode, response.body];
  } catch (e) {
    return [500, e.toString()];
  }
}

Future<List<dynamic>> getRangeStats(String from, String to) async {
  String url = Constants.rangeStatsUrl + "/$from" + "/$to";

  Map<String, String> headers = {"Content-type": Constants.contentType};

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(<String, String>{
        'metadata_token': Constants.mobileToken,
        'auth_token': Constants.authToken,
      }),
    );
    return [response.statusCode, response.body];
  } catch (e) {
    return [500, e.toString()];
  }
}
