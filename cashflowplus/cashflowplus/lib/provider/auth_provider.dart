import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '.././config/constant/api_url.dart';

import '../model/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token = '';
  late DateTime _expiryDate = DateTime.now();
  late String _userId;
  late String _first_name = 'Aditya';
  late String _last_name = 'Gusti';
  late Timer? _authTimer = Timer(const Duration(seconds: 100), logout);
  static String mainUrl = API.MAIN_URL;

  bool get isAuth {
    return token != '';
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != '') {
      return _token;
    }
    return '';
  }

  String get userId {
    return _userId;
  }

  String get names {
    return '$_first_name $_last_name';
  }

  Future<void> _authenticate(String email, String password, String firstName,
      String lastname, String phoneNo, String urlSegment) async {
    final url = Uri.parse('$mainUrl/$urlSegment');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'first_name': firstName,
            'last_name': lastname,
            'phone_no': phoneNo
          },
        ),
      );
      final responseData = json.decode(response.body);
      bool statusError = responseData['error'];
      if (statusError) {
        final message = responseData['message'];
        throw HttpException(message);
      }

      _token = responseData['data']['token'];
      Map<String, dynamic> payload = Jwt.parseJwt(_token);

      _userId = payload['userdata']['customer_id'];
      _first_name = payload['userdata']['first_name'];
      _last_name = payload['userdata']['last_name'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: payload['expired_in']),
      );
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(String email, String password, String firstName,
      String lastName, String phoneNo) async {
    return _authenticate(
        email, password, firstName, lastName, phoneNo, 'register');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, '', '', '', 'login');
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final String? extractData = prefs.getString('userData');
    final extractedUserData = json.decode(extractData!) as Map<String, Object>;
    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'].toString());

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'].toString();
    _userId = extractedUserData['userId'].toString();
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = '';
    _userId = '';
    _expiryDate = DateTime.now();
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
