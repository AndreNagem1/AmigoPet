import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:location/location.dart';
import 'dart:math' show cos, sqrt, asin;

class WalkTracker extends StatefulWidget {
  @override
  _WalkTrackerState createState() => _WalkTrackerState();
}

class _WalkTrackerState extends State<WalkTracker> {
  late Stream<StepCount> _stepCountStream;
  int _steps = 0;
  double _distance = 0.0;
  Location _location = Location();
  LocationData? _lastLocation;

  @override
  void initState() {
    super.initState();
    initPedometer();
    initLocationTracking();
  }

  void initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError((error) {
      print("Pedometer Error: $error");
    });
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
    });
  }

  void initLocationTracking() async {
    await _location.requestPermission();
    _location.changeSettings(accuracy: LocationAccuracy.high);

    _location.onLocationChanged.listen((LocationData currentLocation) {
      if (_lastLocation != null && currentLocation.accuracy != null && currentLocation.accuracy! <= 10) {
        final double distanceIncrement = calculateDistance(
          _lastLocation!.latitude!,
          _lastLocation!.longitude!,
          currentLocation.latitude!,
          currentLocation.longitude!,
        );

        // Ignore very small distance increments
        if (distanceIncrement > 1) { // 1 meter threshold
          setState(() {
            _distance += distanceIncrement;
          });
        }
      }
      _lastLocation = currentLocation;
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    const p = 0.017453292519943295; // Pi / 180
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742000 * asin(sqrt(a)); // 2 * R; R = 6371 km, converted to meters
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Walking Tracker")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Steps: $_steps"),
            Text("Distance: ${_distance.toStringAsFixed(2)} m"),
          ],
        ),
      ),
    );
  }
}