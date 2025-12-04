import 'package:flutter/cupertino.dart';

class StatusProvider with ChangeNotifier {
  bool isLoggedIn = false;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    if (isLoggedIn) {
      isLoggedIn = false;
      notifyListeners();
    }
  }
}
