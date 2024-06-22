import 'dart:async';
import 'dart:io';

import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/theme/textStyle.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/radius.dart';

class IdleUpdateView extends StatefulWidget {
  const IdleUpdateView({super.key});

  @override
  State<IdleUpdateView> createState() => _IdleUpdateViewState();
}

class _IdleUpdateViewState extends State<IdleUpdateView> {
  var currentPosition = const LatLng(0.0, 0.0);
  DateTime? idleTime;

  @override
  void initState() {
    super.initState();
    _startBgGeoLocation();
  }


  Future<void> _startBgGeoLocation() async {
    bg.BackgroundGeolocation.onLocation(
      (bg.Location location) {
        currentPosition =
            LatLng(location.coords.latitude, location.coords.longitude);
        if (Geolocator.distanceBetween(currentPosition.latitude,
                currentPosition.longitude, 37.5689890, 127.0727321) >
            2000) {
          print("넘어감");
        } else {
          print("안넘어감");
        }
        setState(() {});
        print(
            "lat: ${currentPosition.latitude} lng: ${currentPosition.longitude}");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 175),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(HomelessRadius.sm),
                topRight: Radius.circular(HomelessRadius.sm),
              ),
              border: Border.all(color: HomelessColor.line, width: 0.7),
            ),
            padding: const EdgeInsets.all(Spacing.sm),
            child: () {
              if (currentPosition.latitude == 0 ||
                  currentPosition.longitude == 0) {
                return Shimmer.fromColors(
                  baseColor: HomelessColor.mainBlueGrey200,
                  highlightColor: HomelessColor.mainBlueGrey100,
                  child: Container(
                      width: double.infinity,
                      height: 159,
                      color: HomelessColor.mainBlue200),
                );
              } else {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(
                          currentPosition.latitude, currentPosition.longitude),
                      zoom: 14),
                  myLocationEnabled: true,
                );
              }
            }(),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 150),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(HomelessRadius.sm),
                bottomRight: Radius.circular(HomelessRadius.sm),
              ),
              border: Border.all(color: HomelessColor.line, width: 0.7),
            ),
            child: Center(
              child: Column(
                children: [
                  Text("~님 외출하시겠습니까?",
                      style: HomelessTextTheme.sm
                          .copyWith(color: theme.colorScheme.onSecondary))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
