//packages
import 'dart:convert';
import 'package:http/http.dart' as http;

//Routes
import 'package:teste_capyba/routes/routes.dart';

class SignInService {
  signIn(String email, String password) async {

    Uri uri = Uri.parse(Routes.URL_SIGNIN);

    http.Response response = await http.post(uri, body: json.encode({
      "email": email,
      "password": password,
      "returnSecureToken": true
    }));
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}