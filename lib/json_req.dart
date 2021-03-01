import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

final baseurl = 'http://localhost:8080/fl-api/';

Future<List<dynamic>> getN(String ep, {Map<String, String> reqParam}) async {
  Response res;

  if (reqParam != null) {
    res = await get(baseurl + ep + getQueryString(reqParam));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return <dynamic>[];
    }
  } else {
    res = await get(baseurl + ep);
    if (res.statusCode == 200) {
      return compute(parseJsonIsolate, res.body);
    } else {
      return <dynamic>[];
    }
  }
}

Future<Response> delete1(String ep, Map<String, dynamic> obj) async {
  return await delete(baseurl + ep + getQueryString(obj));
}

List<dynamic> parseJsonIsolate(String json) {
  final ret = jsonDecode(json) as List<dynamic>;
  return ret;
}

String getQueryString(Map<String,dynamic> reqParam) {
  String queryString ='?';

  reqParam.removeWhere((k,v) => !k.contains('id'));

   for (int i = 0; i < reqParam.length; i++) {
      queryString +=
          '${reqParam.keys.elementAt(i)}=${reqParam.values.elementAt(i)}';
      if (i != reqParam.length - 1) {
        queryString += '&';
      }
    }
    return queryString;
}
