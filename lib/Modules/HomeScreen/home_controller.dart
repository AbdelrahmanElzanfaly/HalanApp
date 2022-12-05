import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {
  // singleton
  factory HomeController(){
    _this ??= HomeController._();
    return _this!;
  }

  static HomeController? _this;

  HomeController._();

  bool loading = false;
}