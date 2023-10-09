import 'package:ekram_customer/controller/bottomNavBar_controllers.dart';
import 'package:ekram_customer/controller/location_controllers.dart';
import 'package:ekram_customer/shared/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';

class GetLocationView extends StatelessWidget {
  final locationcontroller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return GetBuilder<LocationController>(
        init: LocationController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leadingWidth: 60,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 12),
                  child: SvgPicture.asset("assets/images/arrow_back.svg"),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'موقع التسليم',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'din-next-lt-arabic Light'),
                ),
              ),
              elevation: 0,
              backgroundColor: const Color(0xff07706D),
            ),
            body: PlacePicker(
              onPlacePicked: (result) {
                print(result.toString());
                // Navigator.of(context).pop();
              },
              apiKey:
                  'AIzaSyCoFDt5YFxzHnmAlIL2vFLa3q9K78DHBx8', // Put YOUR OWN KEY here.
              initialPosition: LatLng(
                  locationcontroller.Latitude, locationcontroller.Longitude),
              hidePlaceDetailsWhenDraggingPin: false,
              enableMapTypeButton: false,
              selectInitialPosition: true,
              automaticallyImplyAppBarLeading: false,
              enableMyLocationButton: false,
              autocompleteLanguage: 'ar',
              region: 'Saudia Arabia',
              useCurrentLocation: true,
              selectedPlaceWidgetBuilder:
                  (_, selectedPlace, state, isSearchBarFocused) {
                return FloatingCard(
                  color: Colors.white,
                  bottomPosition: 0,
                  leftPosition: 0,
                  elevation: 5,
                  width: MediaQuery.of(context).size.width,
                  height: 216,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: state == SearchingState.Searching
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Color(0XFFCCA750),
                        ))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                ' موقعك الحالي :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'din-next-lt-arabic Light'),
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0XFFA2B156),
                                  ),
                                  Container(
                                    child: Text(
                                      selectedPlace!.formattedAddress!.toString(),
                                      style: TextStyle(
                                          color: Color(0XFFA2B156),
                                          fontSize: 15,
                                          fontFamily:
                                              'din-next-lt-arabic Medium'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              MainButton(
                                  color: Color(0XFFCCA750),
                                  text: 'تأكيد الموقع',
                                  press: () {
                                    locationcontroller.currentLocation =
                                        selectedPlace.formattedAddress!
                                            .toString();
                                    locationcontroller.update();
                                    print(locationcontroller.currentLocation);
                                    Navigator.pop(context);
                                  })
                            ],
                          ),
                        ),
                );
              },
            ),
          );
        });
  }
}
