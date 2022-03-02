import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void popUpBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        backgroundColor: Colors.grey,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.1,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text('go back'),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/background.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0,
              left: MediaQuery.of(context).size.width / 4,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Image.asset(
                  "assets/images/neighbor-name-and-logo.png",
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                ),
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.width / 2,
                        margin: const EdgeInsets.only(
                          right: 5.0,
                          left: 5.0,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 99, 99),
                              spreadRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => print('find storage'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 38, 39, 38),
                          ),
                          child: Column(
                            children: <Widget>[
                              const Divider(),
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                  "assets/images/find-storage.png",
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.width / 3,
                                ),
                              ),
                              const Text(
                                "Find storage",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.width / 2,
                        margin: const EdgeInsets.only(
                          left: 5.0,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 107, 99, 99),
                              spreadRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => popUpBottomSheet(context),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 38, 39, 38),
                          ),
                          child: Column(
                            children: <Widget>[
                              const Divider(),
                              FittedBox(
                                fit: BoxFit.fill,
                                child: Image.asset(
                                  "assets/images/become-a-host.png",
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: MediaQuery.of(context).size.width / 3,
                                ),
                              ),
                              const Text(
                                "Become a host",
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.03,
                    height: MediaQuery.of(context).size.height / 16,
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: 5.0,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 107, 99, 99),
                          spreadRadius: 1,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => print('log into an existing account'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 38, 39, 38),
                      ),
                      child: const Center(
                        child: Text(
                          "Log into an existing account",
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
