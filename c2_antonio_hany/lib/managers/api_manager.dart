import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:c2_antonio_hany/constants.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:http/http.dart' as http;

class APIManager {
  static final _httpClient = http.Client();

  /// General GET function with headers as optional argument. Default headers:

  /// - Content-Type: application/json

  /// ** Params can be passed as optional arguments **

  Future<Map<String, dynamic>?> get(String url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers = {
        "Accept": "application/json; charset=utf-8",
      };

      try {
        final uri = Uri.https(gDomain, url, params);
        http.Response response = await _httpClient
            .get(uri, headers: headers)
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        Map<String, dynamic> responseBody =
            analyzeResponseBodyBytes(response.bodyBytes);
        return responseBody;
      } catch (ex) {
        print(ex);
      }
    }
  }

  /// General POST function with encoded body - not containing files attached - and headers as optional argument. Default headers:

  /// - Content-Type: application/json

  /// ** Params can be passed as optional arguments **

  Future<Map<String, dynamic>?> post(String url, dynamic body,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers ??= {
        "Accept": "application/json; charset=utf-8",
      };
      http.Response response;
      try {
        final uri = Uri.https(gDomain, url, params);
        response = await _httpClient
            .post(uri, headers: headers, body: json.encode(body))
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        Map<String, dynamic> responseBody =
            analyzeResponseBodyBytes(response.bodyBytes);
        return responseBody;
      } catch (ex) {
        print(ex);
      }
    }
  }

  /// General POST function with encoded body and allowing files and headers as optional argument. Default headers:

  /// - Content-Type: application/json

  /// ** Params can be passed as optional arguments **

  Future<Map<String, dynamic>?> postWithFile(
      String url, Map<String, dynamic> body,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers ??= {
        "Accept": "application/json; charset=utf-8",
      };
      try {
        final uri = Uri.https(gDomain, url, params);
        var request = http.MultipartRequest('POST', uri);
        request.headers.addAll(headers);
        body.forEach((key, value) async {
          if (key.contains('file')) {
            request.files
                .add(await http.MultipartFile.fromPath(key, value.path));
          } else {
            request.fields[key] = value;
          }
        });
        var ioStreamedResponse = await _httpClient.send(request).timeout(
            const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        var response = await http.Response.fromStream(ioStreamedResponse);
        Map<String, dynamic> responseBody =
            analyzeResponseBodyBytes(response.bodyBytes);
        return responseBody;
      } catch (ex) {
        print(ex);
      }
    }
  }

  Future<Map<String, dynamic>?> put(String url, dynamic body,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      // loggedUser.domain="192.168.16.5";

      headers ??= {
        "Accept": "application/json; charset=utf-8",
      };

      try {
        final uri = Uri.https(gDomain, url, params);
        http.Response response = await _httpClient
            .put(uri, headers: headers, body: body)
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));

        Map<String, dynamic> responseBody =
            analyzeResponseBodyBytes(response.bodyBytes);
        return responseBody;
      } catch (ex) {
        print(ex);
      }
    }
  }

  /// General DELETE function with headers as optional argument. Default headers:

  /// - Content-Type: application/json

  ///

  /// ** Params can be passed as optional arguments **

  Future<Map<String, dynamic>?> delete(String url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers ??= {
        "Accept": "application/json; charset=utf-8",
      };
      try {
        final uri = Uri.https(gDomain, url, params);
        http.Response response = await _httpClient
            .delete(uri, headers: headers)
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        Map<String, dynamic> responseBody =
            analyzeResponseBodyBytes(response.bodyBytes);
        return responseBody;
      } catch (ex) {
        print(ex);
      }
    }
  }

  Future<bool> _checkConnectConnectivityAndContinue() async {
    if (!await gCheckInternetConnection()) {
      return false;
    }
    return true;
  }

  Map<String, dynamic> analyzeResponseBodyBytes(Uint8List list) {
    String string = String.fromCharCodes(list);
    print(string);

    Map<String, dynamic> jsonMap = json.decode(string) as Map<String, dynamic>;
    Map<String, dynamic> toReturn2 = convertToMap(jsonMap);
    // Map<String, dynamic> toReturn = Map.fromEntries(jsonMap.entries);
    // Map<String, dynamic> firstData = Map.fromEntries(toReturn["data"].entries);
    // Map<String, dynamic> secondData =
    //     Map.fromEntries(firstData["data"].entries);
    // toReturn["data"] = firstData;
    // toReturn["data"]["data"] = secondData;
    return toReturn2;
  }

  Map<String, dynamic> convertToMap(map) {
    Map<String, dynamic> toReturn = Map.fromEntries(map.entries);
    List<String> keys = toReturn.keys.toList();
    for (String key in keys) {
      if (toReturn[key].runtimeType.toString().contains("_JsonMap")) {
        toReturn[key] = convertToMap(toReturn[key]);
      }
      if (toReturn[key].runtimeType.toString().contains("List")) {
        List list = toReturn[key];
        for (int i = 0; i < list.length; i++) {
          if (list[i].runtimeType.toString().contains("_JsonMap")) {
            toReturn[key][i] = convertToMap(toReturn[key][i]);
          }
        }
      }
    }
    return toReturn;
  }
}
