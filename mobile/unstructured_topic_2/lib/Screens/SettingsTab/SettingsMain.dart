import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unstructured_topic_2/Blocks/theme.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  _SettingsMainState createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Switch(
                value: isSwitched,
                onChanged: (value) {
                  if (!isSwitched) {
                    _themeChanger.setTheme(ThemeData.light());
                  } else {
                    _themeChanger.setTheme(ThemeData.dark());
                  }
                  setState(() {
                    isSwitched = value;
                  });
                }
            )
          ],
        ),
      ),
    );
  }

}