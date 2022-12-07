import 'package:mvc_pattern/mvc_pattern.dart';

class BottomNavigationBarController extends ControllerMVC {
  // singleton
  factory BottomNavigationBarController(){
    _this ??= BottomNavigationBarController._();
    return _this!;
  }

  static BottomNavigationBarController? _this;

  BottomNavigationBarController._();

  bool loading = false;
}