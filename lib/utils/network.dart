import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static const String URL = 'aibolit-qa2.epm-aimd.projects.epam.com';
  static const String API = 'api/v2/public/';
  static const String SYSINFO = 'sysinfo/server-version';
  static const String TABLETKA_QUERY = 'tabletka/query';

  static Future<String> getServerVersion() async {
    final uri = Uri.http(URL, '$API$SYSINFO');
    final response = await http.get(uri);
    String jsonString;

    if (response.statusCode == 200) {
      jsonString = response.body;
    }

    return jsonDecode(jsonString)['BuildNumber'];
  }

  static Future<http.Response> getDrugsAutocomplete(String search) {
    String drugParams = '{\"q\":\"$search\"}';
    Map<String, String> queryParams = {
      'search.autocomplete': drugParams
    };
    var uri = Uri.http(
      URL,
      '$API$TABLETKA_QUERY',
      queryParams,
    );

    return http.get(uri);
  }

}
