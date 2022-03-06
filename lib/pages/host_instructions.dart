import 'package:flutter/material.dart';
import 'package:neighbor_clone/pages/earning_calculation.dart';
import 'package:neighbor_clone/widgets/close_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HostInstructions extends StatefulWidget {
  const HostInstructions({Key? key}) : super(key: key);

  @override
  State<HostInstructions> createState() => _HostInstructionsState();
}

class _HostInstructionsState extends State<HostInstructions> {
  final pageController = PageController(
    initialPage: 0, // index
  );

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
          return const EarningCalculation();
        });
  }

  Widget instructions() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              height: MediaQuery.of(context).size.height / 5,
              margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/dummy.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: const <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Rent your space safely',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      'You get to decide which reservations to approve and when' +
                          ' renters can come. Neighbor gives up to \$1,000,000' +
                          ' of host liability protection, and we offer your' +
                          ' renters protection plans for items they store in' +
                          ' your space.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              height: MediaQuery.of(context).size.height / 5,
              margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/dummy.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Make your space work for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      'Would you clean out your garage for \$1,500? Listing' +
                          ' your space is free, and your earnings are' +
                          ' automatically deposited into your account every' +
                          ' month. Our Payout Protection ensures you always' +
                          ' get paid, even if your renters don\'t pay.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => showPopUpBottomSheet(context),
                      child: const Text(
                        'See how much you could earn >',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              height: MediaQuery.of(context).size.height / 5,
              margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/dummy.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              // decoration: BoxDecoration(border: Border.all(color: Colors.white)),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                children: const <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Join the community',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      'Help out people near you by making your space available' +
                          ' for half the price of a typical storage unit. Join' +
                          ' hosts around the nation already using Neighbor.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 30.0, left: 30.0),
                child: closeButton(context),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 70.0),
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.4,
                child: instructions(),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 16,
                margin: const EdgeInsets.only(bottom: 40.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlue,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                child: GestureDetector(
                  onTap: () => print('list your space clicked'),
                  child: const Center(
                    child: Text(
                      "List your space",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 16,
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 16 + 40.0),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const SlideEffect(
                      dotWidth: 12.0,
                      dotHeight: 12.0,
                      activeDotColor: Colors.lightBlue,
                    ),
                    onDotClicked: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceOut,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
