import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halan/Modules/SavedAddresses/saved_addresses_controller.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/app_bar_widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../../Theme/theme.dart';
import '../../../Utilities/Layout/loading_screen.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_textfeild_widget.dart';
import '../../Widgets/address_details_widget.dart';

class SavedAddressesScreen extends StatefulWidget {
  static String routeName = "/SavedAddressesScreen";

  const SavedAddressesScreen({Key? key}) : super(key: key);

  @override
  _SavedAddressesScreenState createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends StateMVC<SavedAddressesScreen> {
  _SavedAddressesScreenState() : super(SavedAddressesController()) {
    con = SavedAddressesController();
  }

  late SavedAddressesController con;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: LoadingScreen(
        loading: con.loading,
        child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Form(
                key: _formKey,
                autovalidateMode: con.autoValidate
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    AppBarWidget(
                      title: 'Saved Addresses'.tr,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ...[1, 2, 3].map(
                      (e) => AddressDetailsWidget(
                        onEdit: () {},
                        onDelete: () {},
                        title: "Home Address",
                        fullAddress:
                            '7th Street Zakaria Moustafa, Bolak Eldakrour, Giza.Appartment No. 15, 5th Floor.',
                        specialMark: ' Next to Abdelnaser Mosque.',
                        location: 'https://goo.gl/maps/1XgFKbDdFJx5MyQV9',
                        isSelected: false,
                      ),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Container(
                      width: 327.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeClass.containerBackground,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16.w,
                          ),
                          const Icon(Icons.add),
                          SizedBox(
                            width: 6.w,
                          ),
                          const Text('Add New Address.'),
                          const Spacer()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
