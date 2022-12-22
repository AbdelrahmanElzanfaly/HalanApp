import 'package:mvc_pattern/mvc_pattern.dart';

class AdditionalInformationController extends ControllerMVC {
  // singleton
  factory AdditionalInformationController() {
    _this ??= AdditionalInformationController._();
    return _this!;
  }

  static AdditionalInformationController? _this;

  AdditionalInformationController._();

  bool loading = false;

  int index = 0;
}
