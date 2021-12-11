import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unstructured_topic_2/Blocks/theme.dart';

import 'StartScreen.dart';

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'CovidFree',
      theme: theme.getTheme(),
      home: const StartScreen(),
    );
  }
}