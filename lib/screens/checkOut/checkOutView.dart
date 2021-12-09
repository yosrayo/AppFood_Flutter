

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shop_app/screens/checkOut/widgets/summary.dart';

class GetLocation extends StatefulWidget {
    static String routeName = "/checkout";
  const GetLocation({Key? key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Billing adress is the same as delivary adress "),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "La Marsa, Av 14 Janvier",
                      labelText: "Adresse",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Text("send your Current location "),
                  SizedBox(height: 20.0,),


                  ElevatedButton(
                    child: Icon(Icons.location_on_outlined),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () async{
                        Location location = new Location();

                        bool _serviceEnabled;
                        PermissionStatus _permissionGranted;
                        LocationData _locationData;

                        _serviceEnabled = await location.serviceEnabled();
                        if (!_serviceEnabled) {
                          _serviceEnabled = await location.requestService();
                          if (!_serviceEnabled) {
                            return;
                          }
                        }

                        _permissionGranted = await location.hasPermission();
                        if (_permissionGranted == PermissionStatus.denied) {
                          _permissionGranted = await location.requestPermission();
                          if (_permissionGranted != PermissionStatus.granted) {
                            return;
                          }
                        }

                        _locationData = await location.getLocation();
                        print(_locationData.longitude);
                        print(_locationData.latitude);

                      }),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {

                          Get.to(SummaryScreen());


                      }
                    },
                    child:  Text('Text'),
                  ),

                ],
              ),
            ),
          ),
        ),
    );

  }
}