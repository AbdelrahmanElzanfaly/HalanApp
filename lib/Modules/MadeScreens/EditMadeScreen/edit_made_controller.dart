import 'dart:developer';
import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halan/Theme/theme.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../API/auth_api.dart';
import '../../../API/change_password_api.dart';

class EditMadeController extends ControllerMVC {
  // singleton
  factory EditMadeController() {
    _this ??= EditMadeController._();
    return _this!;
  }

  static EditMadeController? _this;

  EditMadeController._();

  bool loading = false, autoValidate = false;
  late TextEditingController phoneController,
      firstNameController,
      endNameController,
      emailController;

  String? otpCode, email;
  File? userImage;
  String? countryName;

  @override
  void initState() {
    firstNameController = TextEditingController();
    endNameController = TextEditingController();
    emailController = TextEditingController();

    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    endNameController.dispose();
    emailController.dispose();
    phoneController.dispose();

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
}
