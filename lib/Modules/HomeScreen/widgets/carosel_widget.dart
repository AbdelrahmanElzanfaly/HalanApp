import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Models/offer_items.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:halan/Modules/AdditionalInformation/additional_information_screen.dart';
import 'package:halan/Utilities/helper.dart';
import '../../../Theme/theme.dart';

class CarouselWidget extends StatefulWidget {
  final List<OfferItem>? productItem;
  final List<String>? caroselList;
  final bool isCarouseDot;

  const CarouselWidget({
    Key? key,
    this.caroselList,
    this.isCarouseDot = true,
    this.productItem,
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
            viewportFraction: (widget.caroselList != null) ? 1 : 1.1,
            aspectRatio: 2.4,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: widget.productItem?.map((e) {
            return GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, AdditionalInformationScreen.routeName,arguments: 'Offers Reservation'.tr);
              },
              child: Container(
                width: 327.w,
                decoration: BoxDecoration(
                  color: ThemeClass.containerBackground,
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Row(
                  children: [
                    FadeIn(
                      delay: 1,
                      from: SlideFrom.RIGHT,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          height: 170.h,
                          width: 76.w,
                          fit: BoxFit.fill,
                          imageUrl:
                              "https://cdn2.hubspot.net/hubfs/53/parts-url.jpg",
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),

                        // Image.network(
                        //   "https://cdn.shopify.com/s/files/1/0554/0737/8621/files/Espresso_Beans_Mobile_Header_900_x_1500_px_1600x.png?v=1655845308",
                        //   fit: BoxFit.fill,
                        //   height: 170.h,
                        //   errorBuilder: (BuildContext, Object, StackTrace) {
                        //     return Text('Your error widget...');
                        //   },
                        // ),
                      ),
                    ),
                    // const Spacer(),
                    SizedBox(
                      width: 245.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  FadeIn(
                                    delay: 1,
                                    from: SlideFrom.LEFT,
                                    child: Text(
                                      'Full House Cleaning',
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ThemeClass.textColor),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                width: 85.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: ThemeClass.secondPrimaryColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                alignment: Alignment.center,
                                child: FadeIn(
                                  delay: 1,
                                  from: SlideFrom.RIGHT,
                                  child: Text(
                                    'AED 1000.00',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ThemeClass.whiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.LEFT,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeClass.hintColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                          FadeIn(
                            delay: 1,
                            from: SlideFrom.BOTTOM,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 13.h,
                                    color: ThemeClass.primaryColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'This Offer Ends In 3 Days.',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ThemeClass.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        if (widget.isCarouseDot)
          SizedBox(
            height: 14.h,
          ),
        if (widget.isCarouseDot)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.productItem?.length ?? 0,
              (index) => buildDot(index, context),
            ),
          )
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 15.w : 10.w,
      width: currentIndex == index ? 15.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index
            ? ThemeClass.primaryColor
            : ThemeClass.primaryColor2,
      ),
    );
  }
}
