import 'package:http/http.dart' as http;

class Network {
  static Future<http.Response> getDrugsAutocomplete(String search) {
    String drugParams = '{\"q\":\"$search\"}';
    Map<String, String> queryParams = {
      'search.autocomplete' : drugParams
    };
    var uri = Uri.https(
      "pub2.aibolit.md",
      "/api/v2/public/tabletka/query",
      queryParams,
    );

    return http.get(uri);
  }

  static Future<http.Response> getDrugs(String search) {
    String drugParams = '{\"ls\":\"$search\",\"regnum\":38,\"inn\":1}';
    Map<String, String> queryParams = {
      'search.drugs' : drugParams
    };
    var uri = Uri.https(
      "pub2.aibolit.md",
      "/api/v2/public/tabletka/query",
      queryParams,
    );

    return http.get(uri);
  }
}
