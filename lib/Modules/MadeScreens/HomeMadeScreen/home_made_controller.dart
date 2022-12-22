import 'package:mvc_pattern/mvc_pattern.dart';


class HomeMadeController extends ControllerMVC {
  // singleton
  factory HomeMadeController(){
    _this ??= HomeMadeController._();
    return _this!;
  }

  static HomeMadeController? _this;

  HomeMadeController._();

  bool loading = false;



}