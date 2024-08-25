import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double latitude = 0,longitude=0;

  @override
  void initState() {
    super.initState();
  }
  late YandexMapController _yandexMapController;
  PlacemarkMapObject? _placemark;
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Select Location')),
        body: Stack(
          children: [
            YandexMap(
              onMapCreated: (YandexMapController controller) {
                _yandexMapController = controller;
              },
              onMapTap: (Point point) async {
                setState(() {
                  _placemark = PlacemarkMapObject(
                    mapId: MapObjectId('selected_placemark'),
                    point: point,
                    icon: PlacemarkIcon.single(
                      PlacemarkIconStyle(
                        image: BitmapDescriptor.fromAssetImage('assets/images/placemark.png',), // Sizning markeringiz rasmi
                        scale: 1.0,
                      ),
                    ),
                  );
                  print(_placemark!.point.longitude);
                });
                // await _getAddress(point);
              },
                mapObjects: _placemark != null ? [_placemark!] : [PlacemarkMapObject(
                  mapId: MapObjectId('selected_placemark'),
                  point: Point(latitude: latitude,longitude:longitude ),
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage('assets/images/placemark.png',), // Sizning markeringiz rasmi
                      scale: 1.0,
                    ),
                  ),
                )],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text(
                  _address.isNotEmpty ? _address : 'Tanlangan joyning nomi',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          onPressed: (){
            _geoLocation();
          },
          child: const Icon(Icons.location_on_outlined,color: Colors.white,),
        ),
      ),
    );
  }

  // Future<void> _getAddress(Point point) async {
  //   final searchResult = await YandexMapkit.instance.search(
  //     query: 'query', // Qidiruv so'rovi
  //     point: point,
  //     zoom: 16,
  //     searchOptions: SearchOptions(),
  //   );
  //
  //   if (searchResult.items != null && searchResult.items!.isNotEmpty) {
  //     final topResult = searchResult.items!.first;
  //     setState(() {
  //       _address = topResult.name;
  //     });
  //   } else {
  //     setState(() {
  //       _address = 'Noma\'lum joy';
  //     });
  //   }
  // }
  _geoLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    longitude = position.longitude;
    latitude = position.latitude;
    await _yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        ),
      ),
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2.0),
    );
    setState(() {});
  }
}
