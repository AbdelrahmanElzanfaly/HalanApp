import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Control/shared_data_provider.dart';
import '../../Theme/theme.dart';

class LanguageDialogWidget extends StatelessWidget {
  const LanguageDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedDataProvider>(builder: (_, provider, __) {
      return SizedBox(
        height: 130.h,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                const Text(
                  "English",
                ),
                const Spacer(),
                Radio(
                  activeColor: ThemeClass.primaryColor,
                  value: 'en',
                  groupValue: provider.choiceLanguage,
                  onChanged: (String? v) {
                    provider.setChoiceLanguage(v!);
                  },
                ),
              ],
            ),
            const Divider(),
            Row(
              children: <Widget>[
                const Text(
                  "العربيه",
                ),
                const Spacer(),
                Radio(
                    activeColor: ThemeClass.primaryColor,
                    value: 'ar',
                    groupValue: provider.choiceLanguage,
                    onChanged: (String? v) {
                      provider.setChoiceLanguage(v!);
                    }),
              ],
            ),
          ],
        ),
      );
    });
  }
}
