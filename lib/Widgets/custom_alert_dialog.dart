import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Theme/theme.dart';

class CustomDialog {
  final String title;
  final String buttonName;
  final Widget des;
  final double? buttonWidth;
  final Color? color;
  final Function() onContinuePressed;
  final BuildContext context;

  CustomDialog( {
    Key? key,
    required this.title,
    this.buttonWidth,
    this.color,
    required this.buttonName,
    required this.des,
    required this.onContinuePressed,
    required this.context
  }){
    _showDeleteDialog(context);
  }

  _showDeleteDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: Center(
        child: Container(
          width: buttonWidth??double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: ThemeClass.secondPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      onPressed: () => onContinuePressed(),
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: color?? Colors.white,
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: ThemeClass.secondPrimaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          InkWell(
              onTap: () {

                Navigator.of(context).pop();
              },
              child:  Icon(Icons.close_sharp,color: color !=null? Colors.white:null,))
        ],
      ),
      content: des,
      actions: [
        //  cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FadeIn(delay: 1, from: SlideFrom.BOTTOM, child: alert);
      },
    );
  }
}
