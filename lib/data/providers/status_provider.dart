import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusProvider with ChangeNotifier {
  bool isLoggedIn = false;

  void login(bool checkBoxValue) {
    isLoggedIn = true;
    notifyListeners();
    if (checkBoxValue) {
      SharedPreferences.getInstance().then(
        (instance) => {
          instance.setBool("isLoggedIn", checkBoxValue),
        },
      );
    }
  }

  void logout() {
    if (isLoggedIn) {
      isLoggedIn = false;
      notifyListeners();
    }
  }
}
