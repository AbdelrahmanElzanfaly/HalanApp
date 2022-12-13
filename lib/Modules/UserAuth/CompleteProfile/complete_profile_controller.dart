import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../Theme/theme.dart';
import '../../../Utilities/helper.dart';
import '../../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';

class CompleteProfileController extends ControllerMVC {
  factory CompleteProfileController() {
    _this ??= CompleteProfileController._();
    return _this!;
  }

  static CompleteProfileController? _this;

  CompleteProfileController._();

  bool loading = false, autoValidate = false, showPassword = false;

  // final GlobalKey<FormState> formKey = GlobalKey();
  String? countryName, locationName;
  late TextEditingController fullNameController,
      yearsExperienceController,
      aboutYourSelfController;
  File? userImage;

  @override
  void initState() {
    fullNameController = TextEditingController();
    yearsExperienceController = TextEditingController();
    aboutYourSelfController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    yearsExperienceController.dispose();
    aboutYourSelfController.dispose();

    super.dispose();
  }

  getCountry(context) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        countryName = country.displayNameNoCountryCode;
        setState(() {});
      },
      countryListTheme: CountryListThemeData(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        inputDecoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeClass.primaryColor),
          ),
          fillColor: ThemeClass.primaryColor,
          hoverColor: ThemeClass.primaryColor,
          focusColor: ThemeClass.primaryColor,
          labelText: 'Search',
          labelStyle: TextStyle(color: ThemeClass.primaryColor),
          hintText: 'Start typing to search',
          prefixIcon: Icon(
            Icons.search,
            color: ThemeClass.primaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        searchTextStyle: TextStyle(
          color: ThemeClass.blackColor,
          fontSize: 18,
        ),
      ),
    );
  }

  Future onSave(BuildContext context) async {
    Modular.to.pushNamed(BottomNavigationBarScreen.routeName);
  }

  updateImage(BuildContext context) async {
    userImage = await Helper.pickImage(context: context);

    setState(() {
      loading = true;
    });

    // bool result = await EditProfileApi.updatePicture(
    //   file: userImage,
    // );

    setState(() {
      loading = false;
    });
    // if (result) {

    // }
  }

//  con.userImage == null? NetworkImage(
//                               SharedPref.getUserObg()?.employee?.profile ??
//                                   'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg')
//                               :
//                           FileImage(File(con.userImage!.path))as ImageProvider,
}
