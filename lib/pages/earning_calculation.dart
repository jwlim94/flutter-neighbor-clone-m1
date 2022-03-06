import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neighbor_clone/pages/earning_calculation_location.dart';
import 'package:neighbor_clone/widgets/close_button.dart';

class EarningCalculation extends StatefulWidget {
  const EarningCalculation({Key? key}) : super(key: key);

  @override
  State<EarningCalculation> createState() => _EarningCalculationState();
}

class _EarningCalculationState extends State<EarningCalculation> {
  late FocusNode lengthFocusNode;
  late FocusNode widthFocusNode;

  final lengthController = TextEditingController();
  final widthController = TextEditingController();
  final locationController = TextEditingController();

  final formatter = NumberFormat('#,###,000');

  @override
  void initState() {
    super.initState();
    lengthFocusNode = FocusNode();
    widthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    lengthFocusNode.dispose();
    widthFocusNode.dispose();

    lengthController.dispose();
    widthController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void requestLengthFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(lengthFocusNode);
    });
  }

  void requestWidthFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(widthFocusNode);
    });
  }

  void showPopUpBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 39, 38),
      builder: (BuildContext context) {
        return EarningCalculationLocation(locationController);
      },
    );
  }

  String calculateEarning() {
    // dummy calculation
    int total =
        int.parse(lengthController.text) + int.parse(widthController.text);
    return '\$' + formatter.format(total);
  }

  bool isEmpty() {
    if (lengthController.text != '' && widthController.text != '') {
      return false;
    } else {
      return true;
    }
  }

  void setCurrentLocation() {
    locationController.text = 'Hello';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 30.0, left: 30.0),
              child: closeButton(context),
            ),
          ),
          const Divider(
            height: 40.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            // delete this height when done with other widgets
            height: MediaQuery.of(context).size.height / 1.6,
            // decoration: BoxDecoration(
            //   border: Border.all(color: Colors.white),
            // ),
            child: Column(
              children: <Widget>[
                const Text(
                  // ignore: prefer_adjacent_string_concatenation
                  'See how much your could earn in a year by listing ' +
                      ' your empty space',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                Text(
                  isEmpty() ? '\$0' : calculateEarning(),
                  style: const TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'per year',
                  style: TextStyle(
                    color: Color.fromARGB(255, 207, 204, 204),
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: TextField(
                        controller: lengthController,
                        focusNode: lengthFocusNode,
                        onTap: requestLengthFocus,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.swap_vert,
                            color: Colors.grey,
                          ),
                          labelText: 'Length',
                          labelStyle: TextStyle(
                              color: lengthFocusNode.hasFocus
                                  ? Colors.lightBlue
                                  : Colors.grey,
                              fontSize: 16.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: TextField(
                        controller: widthController,
                        focusNode: widthFocusNode,
                        onTap: requestWidthFocus,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.swap_horiz,
                            color: Colors.grey,
                          ),
                          labelText: 'Width',
                          labelStyle: TextStyle(
                              color: widthFocusNode.hasFocus
                                  ? Colors.lightBlue
                                  : Colors.grey,
                              fontSize: 16.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3, color: Colors.lightBlue),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                TextField(
                  readOnly: true,
                  controller: locationController,
                  onTap: () => showPopUpBottomSheet(context),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.location_pin,
                      color: Colors.grey,
                    ),
                    labelText: 'Location',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
