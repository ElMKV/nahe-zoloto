import 'package:flutter/widgets.dart';

class NavState extends ChangeNotifier {
  bool? _state;

  bool? get state => _state;

  NavState(this._state);

  logOut() {
    _state = false;
    notifyListeners();
    _state = null;
  }

  logIn() {
    _state = true;
  }
}
