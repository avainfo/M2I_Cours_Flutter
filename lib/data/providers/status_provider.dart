import 'package:flutter/cupertino.dart';
import 'package:m2i_cours_flutter/utils/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusProvider with ChangeNotifier {
  bool isLoggedIn = false;

  void login(bool checkBoxValue) {
    isLoggedIn = true;
    notifyListeners();
    if (checkBoxValue) {
      SharedPreferences.getInstance().then(
        (instance) => {
          instance.setBool(PrefKeys.isLoggedIn, checkBoxValue),
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
