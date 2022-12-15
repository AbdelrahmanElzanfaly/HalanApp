import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:halan/Modules/UserAuth/AddressDetails/address_details_screen.dart';
import '../Utilities/google_search_helper.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class SharedDataProvider with ChangeNotifier, DiagnosticableTreeMixin {

  int _appVersion = 0;
  int get appVersion => _appVersion;

  List<Marker> _markersList = [];
  List<Marker> get markersList => _markersList;
  String? _choiceLanguage = 'en';

  String? get choiceLanguage => _choiceLanguage;

  GoogleMapController? _googleMapController;
  GoogleMapController? get googleMapController => _googleMapController;

  setGoogleMapController(value) {
    _googleMapController = value;
    notifyListeners();
  }

  Future getData()async{
    await Future.delayed(const Duration(seconds: 3));
    _appVersion = 10;
    notifyListeners();
  }

  void setChoiceLanguage(String? lang) {
    _choiceLanguage = lang;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('appVersion', appVersion));
  }
  PlacesDetailsResponse? _detail ;

  PlacesDetailsResponse? get placesDetailsResponse => _detail;
  setPlacesDetailsResponse(value) {
    _detail = value;
    notifyListeners();
  }
  Future<void> handlePressButton(context) async {
    _detail = await GoogleSearchHelper.googleSearch(
      context: context,

      logo: const SizedBox(),
    );

    displayPrediction(_detail,context);

  }



  Future<void> displayPrediction(PlacesDetailsResponse? detail,BuildContext context) async {
    final lat = detail?.result.geometry!.location.lat;
    final lng = detail?.result.geometry!.location.lng;
    final locationName = detail?.result.formattedAddress;

    _markersList.clear();
    _markersList.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat!, lng!),
        infoWindow: InfoWindow(title: detail?.result.name)));

    notifyListeners();

    _googleMapController
        ?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
     // Navigator.of(context).pop(AddressDetailsScreen.routeName, );
  }
}