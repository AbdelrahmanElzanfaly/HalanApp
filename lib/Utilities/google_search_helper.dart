import 'package:badia/Utilities/toast_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class GoogleSearchHelper {
  static const String _googleApiKey = 'AIzaSyDE9edvEd4aB5Lku2Uf86k2Tq2Nr-HyqTo';
  static const Mode _mode = Mode.overlay;

  static Future<PlacesDetailsResponse> googleSearch({
    required Widget logo,
    required BuildContext context,
  }) async {
    Prediction? p = await PlacesAutocomplete.show(
        logo: logo,
        context: context,
        apiKey: _googleApiKey,
        onError: onError,
        mode: _mode,
        language: 'ar',
        strictbounds: false,
        types: [""],
        // sessionToken: Uuid().generateV4(),
        decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white)),
        components: [
          Component(Component.country, "sa"),
          Component(Component.country, "egy")
        ]);

    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: _googleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());
    PlacesDetailsResponse detail =
        await places.getDetailsByPlaceId(p?.placeId ?? '');
    return detail;
  }

  static void onError(PlacesAutocompleteResponse response) {
    ToastHelper.showError(message: response.status);
  }
}
