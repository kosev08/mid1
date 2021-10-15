import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Color primaryColor = Color(0xff47536D);
  static const Color whiteColor = Color(0xffffffff);

  var _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.person,
  ];

  final widgetList = <Widget>[
    const _Home(),
    const _Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "Профиль",
            style: TextStyle(color: whiteColor),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: const _Body(
          primaryColor: primaryColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.qr_code_scanner,
            size: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeColor: const Color(0xff4399e0),
          inactiveColor: primaryColor,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => setState(() {
            _bottomNavIndex = index;
          }),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final Color primaryColor;

  const _Body({Key? key, required this.primaryColor}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 10,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: widget.primaryColor,
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: const Offset(0, 4),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Имя"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        helperStyle: TextStyle(color: widget.primaryColor),
                        labelText: "Курьер",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.blueGrey.shade50,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.blueGrey.shade50,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 20),
                          child: Text(
                            "Изменить",
                            style: TextStyle(
                              color: widget.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Телефон"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.blueGrey.shade50,
                        filled: true,
                        helperStyle: TextStyle(color: widget.primaryColor),
                        labelText: "+7 747 007 7777",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.blueGrey.shade50,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            color: Colors.blueGrey.shade50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: widget.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      right: 30,
                      left: 30,
                      bottom: 15,
                    ),
                    child: Text("История добавления товара"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
