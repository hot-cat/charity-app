import 'package:charity_app/home.dart';
import 'package:charity_app/profile.dart';
import 'package:charity_app/signed.dart';
import 'package:charity_app/theme.dart';
import 'package:charity_app/wavybar.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charity App',
      theme: appTheme,
      home: Directionality(
        // use this property to change direction in whole app
        // CircularBottomNavigation will act accordingly
        textDirection: TextDirection.ltr,
        child: Main(title: 'circular_bottom_navigation'),
      ),
    );
  }
}

class Main extends StatefulWidget {
  Main({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  static const LabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.white, labelStyle: LabelStyle),
    TabItem(Icons.explore_outlined, "Signed", Colors.white,
        labelStyle: LabelStyle),
    TabItem(Icons.person_outline, "Profile", Colors.white,
        labelStyle: LabelStyle
        // circleStrokeColor: Colors.black,
        ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          IgnorePointer(
              child: Align(alignment: Alignment.center, child: WavyBar())),
          Align(alignment: Alignment.bottomCenter, child: bottomNav()),
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color? selectedColor = tabItems[selectedPos].circleColor;
    Widget screen;
    switch (selectedPos) {
      case 0:
        screen = HomeScreen();
        break;
      case 1:
        screen = SignedScreen();
        break;
      case 2:
        screen = ProfileScreen();
        break;
      default:
        screen = HomeScreen();
        break;
    }

    return Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: screen);
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      normalIconColor: Colors.white,
      selectedIconColor: AppColors.lightDarkPurple,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: AppColors.lightPurple,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      // backgroundBoxShadow: <BoxShadow>[
      //   BoxShadow(color: Colors.black45, blurRadius: 10.0)],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
          // print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
