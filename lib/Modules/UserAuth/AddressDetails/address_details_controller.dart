import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:halan/Control/shared_data_provider.dart';
import 'package:halan/Modules/UserAuth/OTP/otp_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

import '../../../API/address_api.dart';
import '../../../Theme/theme.dart';
import '../../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'PickLocationScreen/pick_location_screen.dart';

class AddressDetailsController extends ControllerMVC {
  factory AddressDetailsController() {
    _this ??= AddressDetailsController._();
    return _this!;
  }

  static AddressDetailsController? _this;

  AddressDetailsController._();

  bool loading = false, autoValidate = false, showPassword = false;

  // final GlobalKey<FormState> formKey = GlobalKey();
  String? countryName, locationName;
  late TextEditingController addressNameController,
      streetController,
      cityController,
      zipCodeController,
      specialMarkController,
      stateProvinceController;

  @override
  void initState() {
    addressNameController = TextEditingController();
    streetController = TextEditingController();
    cityController = TextEditingController();
    zipCodeController = TextEditingController();
    stateProvinceController = TextEditingController();
    specialMarkController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addressNameController.dispose();
    streetController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    stateProvinceController.dispose();
    specialMarkController.dispose();
    super.dispose();
  }

  getLocationName(context) {
    Modular.to.pushNamed(PickLocationScreen.routeName);
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
    final provider = Provider.of<SharedDataProvider>(context,listen: false);

    setState(() {
      loading = true;
    });

    bool result = await AddressApi.addAddress(
      addressName: addressNameController.text,
      street: streetController.text,
      city: cityController.text,
      stateProvince: stateProvinceController.text,
      specialMark: specialMarkController.text,
      country: countryName ?? '',
      locationName:
          provider.placesDetailsResponse?.result.formattedAddress.toString() ??
              '',
      lat: provider.placesDetailsResponse?.result.geometry?.location.lat
              .toString() ??
          '',
      lng: provider.placesDetailsResponse?.result.geometry?.location.lng
              .toString() ??
          '',
    );
    setState(() {
      loading = false;
    });

    if (result) {
      Modular.to.pushNamed(BottomNavigationBarScreen.routeName);
    }
  }
}
