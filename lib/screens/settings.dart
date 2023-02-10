import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../navbar.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    Future<AndroidDeviceInfo> getInfo() async {
      return await deviceInfoPlugin.androidInfo;
    }

    Widget showCard(String name, String value) {
      return Card(
        child: ListTile(title: Text('$name : $value')),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<AndroidDeviceInfo>(
          future: getInfo(),
          builder: (context, snapShot) {
            final data = snapShot.data!;
            return ListView(
              children: [
                showCard("Brand", "${data.brand}"),
                showCard("Device", "${data.device}"),
                showCard("Model", "${data.model}"),

              ],
            );
          }),
    );
  }
}
