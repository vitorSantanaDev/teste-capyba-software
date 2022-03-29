//packages
import 'dart:convert';
import 'package:http/http.dart' as http;

//Routes
import 'package:teste_capyba/routes/routes.dart';

class SignUpService {
  signUp(String email, String password) async {

    Uri uri = Uri.parse(Routes.URL_SIGNUP);

    http.Response response = await http.post(uri, body: json.encode({
      "email": email,
      "password": password,
      "returnSecureToken": true
    }));
  }
}