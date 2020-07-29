import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static const String URL =
      'http://my.aibolit-qa2.epm-aimd.projects.epam.com';
  static const String SERVER_VERSION = '/api/v2/public/sysinfo/server-version';

  static Future<String> getServerVersion() async {
    final response = await http.get('$URL$SERVER_VERSION');
    String jsonString;

    if (response.statusCode == 200) {
      jsonString = response.body;
    }

    return jsonDecode(jsonString)['BuildNumber'];
  }

}
