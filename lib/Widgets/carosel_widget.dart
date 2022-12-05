import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme/theme.dart';

class CarouselWidget extends StatefulWidget {
  final List<String>? caroselList;
  final bool isCarouseDot;

  const CarouselWidget({
    Key? key,
    this.caroselList,
    this.isCarouseDot = true,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: (widget.caroselList != null) ? 1 : 0.85,
            aspectRatio: 2.9,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items:  widget.caroselList
                  ?.map((e) => Container(
                      width: 370.w,
                      height: 159.h,
                      decoration: BoxDecoration(
                          color: ThemeClass.whiteColor,
                          borderRadius: BorderRadius.circular(10.sp),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.17),
                              blurRadius: 2.w,
                            )
                          ]),
                      child: Image.network(
                        e,
                        fit: BoxFit.contain,
                      )))
                  .toList(),
        ),
        if (widget.isCarouseDot)

          SizedBox(
          height: 36.h,
        ),
        if (widget.isCarouseDot)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.caroselList?.length ?? 0,
              (index) => buildDot(index, context),
            ),
          )
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.h,
      width: currentIndex == index ? 20.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index
              ? ThemeClass.lightYellowColor
              : Colors.transparent,
          border: Border.all(
              color: currentIndex == index
                  ? Colors.transparent
                  : ThemeClass.blackColor)),
    );
  }
}
