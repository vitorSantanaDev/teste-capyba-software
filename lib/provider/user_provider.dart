//packages
import 'package:flutter/cupertino.dart';

//models
import 'package:teste_capyba/models/user.dart';

class UserProvider extends ChangeNotifier {
  late User _user;
  User get user => _user;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
