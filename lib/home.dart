import 'package:charity_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'custmolscrollBar.dart';

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

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _offset = _controller.offset;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          CustomScrollviewAppBar(offset: _offset),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarAnimation(
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
          )
        ]),
        Container(
            child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicator: DotIndicator(
            color: AppColors.lightDarkPurple,
            distanceFromCenter: 16,
            radius: 5,
            paintingStyle: PaintingStyle.fill,
          ),
          tabs: [
            Tab(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Text("Creativity"))),
            Tab(text: "Activity"),
            Tab(text: "Service"),
          ],
        )),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            Expanded(
              child:
                  //  GetListView()
                  ListView.builder(
                      // key: PageStorageKey(0),
                      itemCount: 30,
                      controller: _controller,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Creativity Event ${index + 1}'),
                        );
                      }),
            ),
            Expanded(
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
