import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/Widgets/question_card_widget.dart';

import '../../../Theme/theme.dart';

class QuestionCardTitleWidget extends StatefulWidget {
  const QuestionCardTitleWidget({Key? key}) : super(key: key);

  @override
  State<QuestionCardTitleWidget> createState() =>
      _QuestionCardTitleWidgetState();
}

class _QuestionCardTitleWidgetState extends State<QuestionCardTitleWidget> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 327,
          child: FadeIn(
            delay: 1,
            from: SlideFrom.TOP,
            child: Text(
              'Do you require cleaning materials ? ',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ThemeClass.blackColor),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    index = 0;
                  });

                  print('Yes, Please.');
                },
                child: QuestionCardWidget(
                  isSelected: index == 0,
                  title: 'Yes, Please.',
                )),
            InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                });

                print('No, I have them');
              },
              child: QuestionCardWidget(
                isSelected: index == 1,
                title: 'No, I have them',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
