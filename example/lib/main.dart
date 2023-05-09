import 'package:flutter/material.dart';
import 'package:google_api/models/geocode_info.dart';
import 'package:google_api/services/geocode_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String google_map_key = "AIzaSyAelsx6xdSTmfs-LCnPlyl3vqhNQRYFMtI";
  List<GeocodeInfo> geocode = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          children: <Widget>[
            Text(geocode.join("\n").toString()),
            ElevatedButton(
              onPressed: () async {
                geocode = await GeocodeServices().getByLocation(
                    key: google_map_key,
                    latitude: 30.0758511,
                    longitude: 31.2045913);
                setState(() {});
              },
              child: Text("Try"),
            )
          ],
        ),
      ),
    );
  }
}
