import 'package:flutter/material.dart';
import 'package:map_location_app/pages/addnewlocation.dart';

import 'package:provider/provider.dart';

import 'blocs/application_blocs.dart';

void main() {
  runApp(MyApp());
}

const primaryColor = const Color(0xFFFFFFFF);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: primaryColor,
        ),
        home: AddNewLocation(),
      ),
    );
  }
}
