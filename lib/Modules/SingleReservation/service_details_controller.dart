import 'package:mvc_pattern/mvc_pattern.dart';


class ServiceDetailsController extends ControllerMVC {
  // singleton
  factory ServiceDetailsController(){
    _this ??= ServiceDetailsController._();
    return _this!;
  }

  static ServiceDetailsController? _this;

  ServiceDetailsController._();

  bool loading = false;

  int index = 0;

}