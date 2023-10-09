import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class TrackLocationView extends StatefulWidget {
  @override
  State<TrackLocationView> createState() => _TrackLocationViewState();
}

class _TrackLocationViewState extends State<TrackLocationView> {
  final Completer<GoogleMapController> _completer = Completer();
  static const LatLng sourceLocation =
      LatLng(21.481871351248873, 39.94693181974725);
  static const LatLng destination =
      LatLng(21.48358563014703, 39.938798211346516);

  LocationData? currentLocation;
var address='';
  List<LatLng> polyLineCoordinates = [];
  BitmapDescriptor currentLocIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor sourceLocIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destLocIcon = BitmapDescriptor.defaultMarker;
  Uint8List? markerIcon;
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    debugPrint('1.....................................');

    PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
            'AIzaSyCoFDt5YFxzHnmAlIL2vFLa3q9K78DHBx8',
            PointLatLng(21.481871351248873, 39.94693181974725),
            PointLatLng(21.48358563014703, 39.938798211346516))
        .catchError((error) {
      debugPrint('This is how is Error.....................................');
      debugPrint(error.toString());
    });

    if (result.points.isNotEmpty) {
      debugPrint('This is how is done.....................................');
      result.points.forEach((element) {
        polyLineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
      setState(() {});
    } else {
      debugPrint('Empty.....................................');
      debugPrint(result.status);
    }
  }

  void getLocation() async {
    Location location = Location();
    debugPrint('Begining');
    location.getLocation().then((value) {
      debugPrint('${value.longitude}   ..........');
      currentLocation = value;
      
      setState(() {
        debugPrint(currentLocation!.latitude.toString());
      });
    }).catchError((error) {
      debugPrint('$error   New Error2');
    });
    GoogleMapController googleMapController =
        await _completer.future.catchError((error) {
      debugPrint('$error   New Error');
    });

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 16,
              target: LatLng(
                  21.482530283172125, 39.946803069316644))));
      setState(() {});
    });
  }
  // Future<void> _getCurrentPosition() async {
  //   await Geolocator.getCurrentPosition().then((Position position) {
  //     setState(() => _currentPosition = position);
  //     _getAddressFromLatLng(_currentPosition!);
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddressLocation =
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //     });
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });

  // }

  void setCustomIcons() async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/mylocation.png")
        .then(
      (icon) {
        sourceLocIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/des.png")
        .then(
      (icon) {
        destLocIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/car.png")
        .then(
      (icon) {
        currentLocIcon = icon;
      },
    );
    // currentLocIcon = await BitmapDescriptor.fromAssetImage(
    //     const ImageConfiguration(devicePixelRatio: 2.0),
    //     'assets/images/userAvatar.png');
    // markerIcon = await getBytesFromAsset('assets/images/abdo2.png', 70);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    setCustomIcons();
    getPolyPoints();
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightApp = MediaQuery.of(context).size.height;
    var widthApp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(centerTitle: true,
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
            'التتبع',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'din-next-lt-arabic Light'),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff07706D),
      ),
      body: currentLocation != null
          ? Stack(
              children: [
                Center(
                    child: GoogleMap(
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(21.482530283172125,
                        39.946803069316644),
                    zoom: 16,
                  ),
                  polylines: {
                    Polyline(
                        polylineId: const PolylineId('route'),
                        points: polyLineCoordinates,
                        color: Color(0XFFBFA06B),
                        width: 8)
                  },
                  markers: {
                    Marker(
                        markerId: MarkerId('MomHome'),
                        icon: sourceLocIcon,
                        position:  LatLng(21.482530283172125,
                        39.946803069316644)),
                    Marker(
                        markerId: MarkerId('Fasel'),
                        icon: destLocIcon,
                        position: 
                     
                         LatLng(21.4833289606468,
                            39.93929288431354)),
                    Marker(
                        markerId: const MarkerId('CurrentLocation'),
                        visible: true,
                        icon: currentLocIcon,
                        position:  LatLng(21.482530283172125,
                        39.946803069316644)),
                  },
                  onMapCreated: (con) {
                    _completer.complete(con);
                  },
                )),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    height: 94,
                    width: 368,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 30, left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/images/locationGreen.svg'),
                              SvgPicture.asset('assets/images/lineRed.svg'),
                              SvgPicture.asset(
                                  'assets/images/locationBlack.svg'),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'موقعك الحالي : جمعية إكرام لحفظ الطعام',
                                style: TextStyle(
                                    color: Color(0xff839541),
                                    fontSize: 12,
                                    fontFamily: 'din-next-lt-arabic Light'),
                              ),
                              Container(
                                height: 1,
                                width: 250,
                                color: Color(0XFFBABABA).withOpacity(.10),
                                margin: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                    left: 10.0,
                                    right: 10.0),
                              ),
                              Text(
                                'موقع السائق : قاعة نجوم الليل للاحتفالات',
                                style: TextStyle(
                                    color: Color(0xff839541),
                                    fontSize: 12,
                                    fontFamily: 'din-next-lt-arabic Light'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          : Center(
              child: Text(
                'الرجاء الانتظار ليتم جلب موقعك الحالي',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'din-next-lt-arabic Light'),
              ),
            ),
    );
  }
}
