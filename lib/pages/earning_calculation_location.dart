import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:neighbor_clone/widgets/close_button.dart';

class EarningCalculationLocation extends StatefulWidget {
  // get locationController from previous page
  final TextEditingController locationController;

  // get locationController from previous page
  const EarningCalculationLocation(this.locationController, {Key? key})
      : super(key: key);

  @override
  State<EarningCalculationLocation> createState() =>
      _EarningCalculationLocationState();
}

class _EarningCalculationLocationState
    extends State<EarningCalculationLocation> {
  // location text field
  late FocusNode locationFocusNode;
  final controller = TextEditingController();

  // get current location
  late LocationPermission locationPermission;

  @override
  void initState() {
    super.initState();
    locationFocusNode = FocusNode();
  }

  @override
  void dispose() {
    locationFocusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  void requestLocationFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(locationFocusNode);
    });
  }

  void getCurrentLocaion() async {
    locationPermission = await Geolocator.requestPermission();

    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true);

    getAddressFromLatLng(currentPosition);

    Navigator.pop(context);
  }

  void getAddressFromLatLng(Position currentPosition) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      Placemark place = placemarks[0];

      // use locationController from previous page to set location in text field
      widget.locationController.text =
          // ignore: prefer_adjacent_string_concatenation
          "${place.street}, ${place.administrativeArea}, ${place.isoCountryCode}" +
              " ${place.postalCode}";

      print(place);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0, left: 30.0),
                  child: closeButton(context),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2 - 35.0,
                margin: const EdgeInsets.only(top: 30.0),
                child: const Text(
                  "Location",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 40.0,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextField(
                  focusNode: locationFocusNode,
                  controller: controller,
                  onTap: requestLocationFocus,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    labelText: 'Enter city or address',
                    labelStyle: TextStyle(
                      color: locationFocusNode.hasFocus
                          ? Colors.lightBlue
                          : Colors.grey,
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () => getCurrentLocaion(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.location_pin,
                      color: Colors.lightBlue,
                    ),
                    Text(
                      'Use my current location',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
