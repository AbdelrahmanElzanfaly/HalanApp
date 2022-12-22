import 'package:mvc_pattern/mvc_pattern.dart';

class ContractReservationController extends ControllerMVC {
  // singleton
  factory ContractReservationController() {
    _this ??= ContractReservationController._();
    return _this!;
  }

  static ContractReservationController? _this;

  ContractReservationController._();

  bool loading = false;
  int indexMade = 0;

}
