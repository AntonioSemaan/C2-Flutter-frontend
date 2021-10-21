import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:c2_antonio_hany/constants.dart';
import 'package:c2_antonio_hany/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class APIManager {
  static final _httpClient = http.Client();

  /// General GET function with headers as optional argument. Default headers:

  /// - Content-Type: application/json

  /// ** Params can be passed as optional arguments **

  Future<http.Response?> get(String url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers = {
        "Content-Type": "application/json; charset=utf-8",
      };

      try {
        final uri = Uri.https(gDomain, url, params);
        http.Response response = await _httpClient
            .get(uri, headers: headers)
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        return response;
      } catch (ex) {
        print(ex);
      }
    }
  }

  /// General POST function with encoded body - not containing files attached - and headers as optional argument. Default headers:

  /// - Content-Type: application/json

  /// ** Params can be passed as optional arguments **

  Future<http.Response?> post(String url, dynamic body,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers ??= {
        "Content-Type": "application/json",
      };
      http.Response response;
      try {
        final uri = Uri.https(gDomain, url, params);
        response = await _httpClient
            .post(uri, headers: headers, body: json.encode(body))
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        return response;
      } catch (ex) {
        print(ex);
      }
    }
  }

  /// General POST function with encoded body and allowing files and headers as optional argument. Default headers:

  /// - Content-Type: application/json

  /// ** Params can be passed as optional arguments **

  Future<http.Response?> postWithFile(String url, Map<String, dynamic> body,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers ??= {
        "Content-Type": "application/json; charset=utf-8",
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

        return response;
      } catch (ex) {
        print(ex);
      }
    }
  }

  Future<http.Response?> put(String url, dynamic body,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      // loggedUser.domain="192.168.16.5";

      headers ??= {
        "Content-Type": "application/json; charset=utf-8",
      };

      try {
        final uri = Uri.https(gDomain, url, params);
        http.Response response = await _httpClient
            .put(uri, headers: headers, body: body)
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));

        return response;
      } catch (ex) {
        print(ex);
      }
    }
  }

  /// General DELETE function with headers as optional argument. Default headers:

  /// - Content-Type: application/json

  ///

  /// ** Params can be passed as optional arguments **

  Future<http.Response?> delete(String url,
      {Map<String, String>? params, Map<String, String>? headers}) async {
    if (await _checkConnectConnectivityAndContinue()) {
      headers ??= {
        "Content-Type": "application/json; charset=utf-8",
      };
      try {
        final uri = Uri.https(gDomain, url, params);
        http.Response response = await _httpClient
            .delete(uri, headers: headers)
            .timeout(
                const Duration(seconds: Constants.TIMEOUT_DURATION_SECONDS));
        return response;
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
}
