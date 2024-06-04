import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  /// Retrieves data from the specified [url] using an HTTP GET request.
  ///
  /// This function sends an HTTP GET request to the specified [url], and
  /// waits for a response. If the response status code is 200 (OK), it
  /// decodes the response body into a dynamic object using JSON decoding.
  ///
  /// The function returns a [Future] that completes with the decoded
  /// object. If the response status code is not 200, it throws an exception
  /// with a message indicating the problem with the status code.
  ///
  /// Parameters:
  ///  - [url]: The URL to send the HTTP GET request to.
  ///
  /// Returns:
  ///  - A [Future] that completes with the decoded response body, or throws
  ///    an exception if the response status code is not 200.
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    // Send an HTTP GET request to the specified URL
    http.Response response = await http.get(Uri.parse(url), headers: headers);

    // Check the response status code
    if (response.statusCode == 200) {
      // Decode the response body into a dynamic object and return it
      return jsonDecode(response.body);
    } else {
      // Throw an exception indicating the problem with the status code
      throw Exception(
          'There is a problem with the status code: ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.post(
      Uri.parse(
        url,
      ),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        'There is a problem with the status code: ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    print(' url = $url body = $body token = $token');
    http.Response response = await http.put(
      Uri.parse(
        url,
      ),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      print(data);
      return data;
    } else {
      throw Exception(
        'There is a problem with the status code: ${response.statusCode} with body ${jsonDecode(response.body)}',
      );
    }
  }
}
