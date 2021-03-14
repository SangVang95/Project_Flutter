import 'package:chat_app/map/helper/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  Future<void> _getCurrentLocation() async {
    // Check service and permission
    final location = Location();
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      print("disable serview 1");
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("disable serview 2");
        return;
      }
    }

    PermissionStatus _permission = await location.hasPermission();
    if (_permission == PermissionStatus.denied) {
      print('permision 1');
      _permission = await location.requestPermission();
      if (_permission != PermissionStatus.granted) {
        print('permission 2');
        return;
      }
    }
    // Get location
    final locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
    final mapUrl = LocationHelper.generateLocation(
        locationData.latitude, locationData.longitude);
    setState(() {
      _previewImageUrl = mapUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'No location',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.location_on_outlined),
                label: Text(
                  'Current location',
                )),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text(
                  'Select on Map',
                )),
          ],
        )
      ],
    );
  }
}
