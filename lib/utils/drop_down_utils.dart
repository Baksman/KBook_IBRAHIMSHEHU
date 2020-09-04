import 'package:flutter/cupertino.dart';

class DropdownUtils extends ChangeNotifier {
  final List<String> items = ["All", "Favorite"];
  String _value;

  DropdownUtils() {
    _value = items[0];
  }

  get value => _value;

  setState(String value) {
    _value = value;
    notifyListeners();
  }
}
