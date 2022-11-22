import 'package:charity_app/event.dart';
import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'custmolscrollBar.dart';
import 'customWeekBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  TextEditingController textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  double _offset = 0.0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        _offset = (_tabController.indexIsChanging) ? 0 : _controller.offset;
      });
    });
    _tabController.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _offset = 0.0;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget barTextContainer(String title) {
    return Container(
        width: 100,
        height: 25,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text("${title}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          CustomScrollviewAppBar(offset: _offset),
          // CustomWeekBar(offset: _offset),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SearchBarAnimation(
                textEditingController: TextEditingController(),
                isOriginalAnimation: true,
                enableKeyboardFocus: true,
                durationInMilliSeconds: 100,
                onExpansionComplete: () {
                  debugPrint('do something just after searchbox is opened.');
                },
                onCollapseComplete: () {
                  debugPrint('do something just after searchbox is closed.');
                },
                onPressButton: (isSearchBarOpens) {
                  debugPrint(
                      'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                },
                trailingWidget: const Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.darkPurple,
                ),
                secondaryButtonWidget: const Icon(
                  Icons.close,
                  size: 20,
                  color: AppColors.darkPurple,
                ),
                buttonWidget: const Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.darkPurple,
                ),
              ),
            ]),
          )
        ]),
        Container(
            child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicator: DotIndicator(
            color: AppColors.lightDarkPurple,
            distanceFromCenter: 23,
            radius: 5,
            paintingStyle: PaintingStyle.fill,
          ),
          tabs: [
            Tab(child: barTextContainer("Creativity")),
            Tab(child: barTextContainer("Activity")),
            Tab(child: barTextContainer("Service")),
          ],
        )),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            Expanded(
              flex: 1,
              child:
                  //  GetListView()
                  ListView.builder(
                      // key: PageStorageKey(0),
                      itemCount: 30,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return EventWidget();
                      }),
            ),
            Expanded(
              flex: 2,
              child:
                  //  GetListView()
                  ListView.builder(
                      // key: PageStorageKey(1),
                      controller: _controller,
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Activity Event ${index + 1}'),
                        );
                      }),
            ),
            Expanded(
              flex: 3,
              child:
                  //  GetListView()
                  ListView.builder(
                      // key: PageStorageKey(1),
                      controller: _controller,
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Service Event ${index + 1}'),
                        );
                      }),
            ),
          ],
        ))
      ],
    ));
  }
}
