import 'package:flutter/material.dart';
import 'package:unstructured_topic_2/Screens/AnalyticsTab/AnalyticsMain.dart';
import 'package:unstructured_topic_2/Screens/GreenPassTab/GreenPassChoose.dart';
import 'package:unstructured_topic_2/Screens/InsertTab/InsertMain.dart';
import 'package:unstructured_topic_2/Screens/SettingsTab/SettingsMain.dart';
import 'package:unstructured_topic_2/constraints.dart';


/*
* Decide which screen to run either with taxCode
* or without it
* */

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  static const lengthTabs = 3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: lengthTabs,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget> [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  flexibleSpace: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TabBar(
                        indicatorWeight: 5.0,
                        tabs: [
                          Tab(icon: Icon(Icons.analytics_outlined),),
                          Tab(icon: Icon(Icons.event_note_outlined),),
                          Tab(icon: Icon(Icons.settings_outlined),)
                        ],
                      )
                    ],
                  ),
                )
              ];
            },
            body: const TabBarView(
              children: [
                AnalyticsMain(),
                InsertMain(),
                SettingsMain()
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _checkGreenPass,
            child: const Icon(Icons.camera_alt_outlined),
            backgroundColor: kPrimaryColor,
          ),
        )
    );
  }

  void _checkGreenPass() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GreenPassChoose()));
  }
}
