import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SingleReservation/Widgets/question_card_widget.dart';
import 'package:halan/Theme/theme.dart';
import 'package:intl/intl.dart';

import '../../ReservationsScreen/reservations_screen.dart';

class QuestionsWidgets extends StatefulWidget {
  final int? length, start;
  final Function(int index) onTap;
  final String? title;
  final bool isTime, isSelected;
  final List? model;


  const QuestionsWidgets(
      {Key? key,
        this.length,
        this.start,
        required this.onTap,
        this.title,
        required this.isTime,
        required this.isSelected, this.model})
      : super(key: key);

  @override
  State<QuestionsWidgets> createState() => _QuestionsWidgetsState();
}

class _QuestionsWidgetsState extends State<QuestionsWidgets> {
  int i = 0;
  var now = DateTime.now();

  get list => List.generate(now.month, (i) => now.add(Duration(days: i)));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 327,
          child: FadeIn(
            delay: 1,
            from: SlideFrom.TOP,
            child: Text(
              widget.title ?? '',
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
       if(widget.model == null)
        widget.isTime
            ? SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(list.length, (index) {
              return FadeIn(
                delay: 1,
                from: SlideFrom.LEFT,
                child: GestureDetector(
                  onTap: () => widget.onTap(index),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      i = index;
                      print(list[index].day);
                    }),
                    child: Column(
                      children: [
                        Text(
                          DateFormat.E().format(list[index]).toString(),
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: ThemeClass.blackColor),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Container(
                            width: 36.w,
                            height: 36.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: i == index
                                    ? ThemeClass.secondPrimaryColor
                                    : ThemeClass.greyColor),
                            alignment: Alignment.center,
                            child: Text(
                              list[index].day.toString(),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: i == index
                                      ? ThemeClass.whiteColor
                                      : ThemeClass.textColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        )
            : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(widget.length ?? 0, (index) {
              return FadeIn(
                delay: 1,
                from: SlideFrom.LEFT,
                child: GestureDetector(
                  onTap: () => widget.onTap(index),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      i = index;
                      print(i + 1);
                    }),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: i == index
                                ? ThemeClass.secondPrimaryColor
                                : ThemeClass.greyColor),
                        alignment: Alignment.center,
                        child: Text(
                          (index + widget.start!).toString(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: i == index
                                  ? ThemeClass.whiteColor
                                  : ThemeClass.textColor),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),



      ],
    );
  }
}
