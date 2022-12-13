// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halan/Utilities/helper.dart';
import 'package:halan/Widgets/custom_button.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


import '../../../Control/shared_data_provider.dart';
import '../../../Widgets/app_bar_widget.dart';

class PickLocationScreen extends StatefulWidget {
  static const String routeName = "/PickLocationScreen";

  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  _PickLocationScreenState createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends StateMVC<PickLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<SharedDataProvider>(
        builder: (__, provider, _) {
          return Stack(
            children: [
              GoogleMap(

                myLocationButtonEnabled: false,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: false,
                trafficEnabled: true,
                scrollGesturesEnabled: true,
                mapType: MapType.normal,
                markers: Set.from(provider.markersList),
                initialCameraPosition: const CameraPosition(
                    target: LatLng(30.42796133580664, 31.085749655962),
                    zoom: 13,
                    bearing: 100.0,
                    tilt: 20),
                onCameraMove: (location) {
                  // provider.setCameraLocation(location.target);
                },
                // onCameraIdle: () {
                //   if (provider.cameraLocation != null &&
                //       provider.tripStatus == 0 &&
                //       provider.isShowOnMap!) {
                //     provider.onCameraIdle(provider.cameraLocation!);
                //   }
                // },
                onMapCreated: (GoogleMapController controller) {
                  provider.setGoogleMapController(controller);
                },
              ),
              Positioned(
                top: 50.h,
                left: 20.w,
                right: 20.w,
                child:    const FadeIn(
                  delay: 1,
                  from: SlideFrom.LEFT,
                  child: AppBarWidget(),
                ),
              ),
              Positioned(
                bottom: 100.h,
                left: 20.w,
                right: 20.w,
                child: provider.placesDetailsResponse?.result.formattedAddress != null ? CustomButton(
                  width: 250.w,
                  height: 50.h,
                  ontap: () {

               Navigator.pop(context);
                  },
                  name: "Confirm".tr,
                ):CustomButton(
                  width: 250.w,
                  height: 50.h,
                  ontap: () {
                    provider.handlePressButton(context);
                  },
                  name: "Pick Location".tr,
                )
              ),
            ],
          );
        },
      ),
    );
  }
}
