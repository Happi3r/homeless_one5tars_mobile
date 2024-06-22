import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homeless/api/api.dart';
import 'package:homeless/model/coOp.dart';
import 'package:homeless/theme/color.dart';
import 'package:homeless/theme/radius.dart';
import 'package:homeless/theme/spacing.dart';
import 'package:homeless/theme/textStyle.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Set<Marker> _markers = {};
  Future<List<CoOpModel>>? _fetchCoOpModel;

  bool _disposed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchCoOp();
  }
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void _fetchCoOp() {
    setState(() {
      _fetchCoOpModel = Api.fetchCoOp();
    });
  }

  Future<Uint8List> getImageBytes(String imageUrl) async {
    final http.Response response = await http.get(Uri.parse(imageUrl));
    return response.bodyBytes;
  }

  Future<void> _addMarker(CoOpModel coop) async {
    MarkerId markerId = MarkerId(coop.uuid);
    double lat = coop.lat ?? 0;
    double lng = coop.lng ?? 0;

    print("coop $coop");
    Uint8List? imageBytes;
    if (coop.mainImage != null) {
      imageBytes = await getImageBytes(coop.mainImage!);
    }
    print("coop1 $coop");
    final marker = Marker(
      markerId: markerId,
      position: LatLng(lat, lng),
      infoWindow: const InfoWindow(
          title: 'Marker Title', snippet: 'Marker Description'),
      icon: imageBytes != null
          ? BitmapDescriptor.fromBytes(imageBytes)
          : BitmapDescriptor.defaultMarker,
    );
    print("marker $marker");
    if (!_disposed) {
      setState(() {
        _markers.add(marker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              const CameraPosition(target: LatLng(37.5666, 126.9782), zoom: 15),
          markers: _markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Spacing.md, right: Spacing.md, top: Spacing.lg),
          child: FutureBuilder(
            future: _fetchCoOpModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: double.infinity,
                  height: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.md,
                  ),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.background,
                      borderRadius:
                          BorderRadius.circular(HomelessRadius.circle)),
                  child: Center(
                    child: () {
                      if (snapshot.hasError) {
                        return Text("에러가 발생했습니다...",
                            style: HomelessTextTheme.sm.copyWith(
                                color: theme.colorScheme.onSecondary));
                      } else {
                        return Text("지원 시설 정보를 받아오고 있습니다...",
                            style: HomelessTextTheme.sm.copyWith(
                                color: theme.colorScheme.onSecondary));
                      }
                    }(),
                  ),
                );
              }
              if (snapshot.hasData) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  snapshot.data?.forEach((e) {
                    _addMarker(e);
                  });
                });
                return Container();
              }
              return Container();
            },
          ),
        )
      ],
    ));
  }
}
