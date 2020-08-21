import 'dart:convert';

import 'package:AibolitFlutter/entity/network/drug_autocomplete.dart';
import 'package:http/http.dart' as http;

class Converter {

  static List<DrugAutocomplete> getDrugAutocomplete(http.Response response) {
    List<DrugAutocomplete> result = (json.decode(utf8.decode(response.bodyBytes)) as List)
        .map((data) => DrugAutocomplete.fromJson(data))
        .toList();

    return result;
  }
}