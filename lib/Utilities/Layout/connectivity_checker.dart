import 'package:flutter/material.dart';

import '../../Widgets/network_error.dart';
import '../connection_status.dart';

class ConnectivityChecker extends StatefulWidget {
  final Widget child;
  final Function()? onLoading;
  const ConnectivityChecker({Key? key, required this.child, this.onLoading})
      : super(key: key);

  @override
  State<ConnectivityChecker> createState() => _ConnectivityCheckerState();
}

class _ConnectivityCheckerState extends State<ConnectivityChecker> {
  @override
  void initState() {
    ConnectivityHelper().addListener(widget.onLoading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: ConnectivityHelper().connectionChange,
        initialData: true,
        builder: (context, snapshot) {
          return !snapshot.data!
              ? const NetworkError()
              : widget.child;
        });
  }
}
