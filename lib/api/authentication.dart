import 'dart:convert';

import 'package:untitled/api/api_util.dart';
import 'package:untitled/customer/user.dart';
import 'package:http/http.dart' as http;

class Authentication {
  Future<User?> register(String first_name, String last_name, String password,
      String email) async {
    String register_api = ApiUtl.AUTH_RESGISTER;

    var headers = {
      'accept': 'application/json',
    };

    var body = {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password
    };

    try {
      http.Response response = await http.post(Uri.parse(register_api),
          headers: headers, body: body);

      if (response.statusCode == 201) {
        var body = jsonDecode(response.body);
        var data = body['data'];
        return User.fromJson(data);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<User?> login(String email, String password) async {
    Map<String, String> headers = {'accpet': 'application/json'};

    Map<String, String> body = {'email': email, 'password': password};
    http.Response response = await http.post(Uri.parse(ApiUtl.AUTH_LOGIN),
        headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var data = body['data'];
      print(data);

      return User.fromJson(data);
    }

    return null;
  }
}
