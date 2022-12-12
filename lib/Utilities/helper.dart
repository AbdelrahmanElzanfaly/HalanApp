
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:flutter_modular/flutter_modular.dart'; // ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Utilities/toast_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../Theme/theme.dart';
import '../locale/locales.dart';
import 'Layout/show_images.dart';

extension OnTapImageExtension on Image {
  Widget showOnTap() {
    return InkWell(
      onTap: () {
        Modular.to.push(MaterialPageRoute(
            builder: (_) => ShowImagesWidget(
                  images: const [],
                  image: image,
                )));
      },
      child: this,
    );
  }
}

extension OnTapFadeImageExtension on FadeInImage {
  Widget showOnTap() {
    return InkWell(
      onTap: () {
        Modular.to.push(MaterialPageRoute(
            builder: (_) => ShowImagesWidget(
                  images: const [],
                  image: image,
                )));
      },
      child: this,
    );
  }
}



extension Translate on String {
  String get tr => AppLocalizations.instance.translate(this) ?? "";
}

class Helper {

  static Future<File?> pickImage(
      {required BuildContext context, bool? isGallery}) async {
    isGallery ??= await Helper.getImageSource(
      context,
    );
    if (isGallery == null) return null;
    final XFile? file = await ImagePicker().pickImage(
        source: isGallery ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 65);
    if (file != null) return File(file.path);
    return null;
  }

  static handleError(var result) {
    if (result.runtimeType != String) {
      ToastHelper.showError(
          message: result.join('!@#').replaceAll('!@#', "'\n"));
    } else {
      ToastHelper.showError(message: result??"");
    }
  }

  static Future<bool?> getImageSource(BuildContext context,
      {bool isImage = true}) async {
    bool? isGallery;
    await showCupertinoModalPopup(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                  isImage
                      ? 'choose_image_source'.tr
                      : "choose_video_source".tr,
                  style: TextStyle(
                      color: ThemeClass.primaryColor, fontSize: 20.sp)),
            ),
            actions: [
              Material(
                  color: Colors.grey.shade200,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      isGallery = true;
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Text(
                          'from_gallery'.tr,
                          style:
                          TextStyle(color: Colors.black87, fontSize: 18.sp),
                        )),
                  )),
              Material(
                  color: Colors.grey.shade200,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      isGallery = false;
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 20.h),
                        child: Text(
                          'from_camera'.tr,
                          style:
                          TextStyle(color: Colors.black87, fontSize: 18.sp),
                        )),
                  )),
            ],
          );
        });
    return isGallery;
  }

  static final formatter = DateFormat('yyyy-MM-dd');
  static final hoursMinutesFormatter = DateFormat('HH:mm');

  static const String imagePlaceHolder =
      "https://smooal-7oob.net/wp-content/themes/belfast/images/placeholder.png";
}
