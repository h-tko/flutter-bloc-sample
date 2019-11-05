import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_sample/src/ui/scenery_list.dart';

class BlocSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SceneryList(),
      ),
    );
  }
}
