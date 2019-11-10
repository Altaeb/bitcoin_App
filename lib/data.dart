import 'dart:convert';

import 'package:bitcoin/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    http.Response response = await http.get('etf');
    if (response.statusCode == 200) {
      String data = response.body;
      var use = await jsonDecode(data)['last'];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PriceScreen();
          },
        ),
      );
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.lightBlue,
        size: 100.0,
      ),
    );
  }
}
