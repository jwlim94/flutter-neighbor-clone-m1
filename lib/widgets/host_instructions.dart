import 'package:flutter/material.dart';

final controller = PageController(
  initialPage: 0, // index
);

Widget hostInstructions(context) {
  return PageView(
    controller: controller,
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
              children: const <Widget>[
                Align(
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
                Divider(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
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
