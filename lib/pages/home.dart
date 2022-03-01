import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          // border: Border.all(color: Colors.white),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/black-rocks.jpeg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100.0),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.white),
              // ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.asset(
                "assets/images/neighbor-name-and-logo.png",
                width: MediaQuery.of(context).size.width / 2,
              ),
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }
}
