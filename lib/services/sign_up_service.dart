//packages
import 'dart:convert';
import 'package:http/http.dart' as http;

//Routes
import 'package:teste_capyba/routes/routes.dart';

class SignUpService {
  signUp(String name, String email, String password) async {
    Uri uri = Uri.parse(Routes.URL_SIGNUP);

    http.Response response = await http.post(uri,
        body: json.encode({
          "email": email,
          "password": password,
          "displayName": name,
          "returnSecureToken": true
        }));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
