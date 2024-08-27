import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:stroy_baza/src/theme/app_colors.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';
import 'package:stroy_baza/src/utils/rx_bus.dart';
import 'package:stroy_baza/src/widgets/button_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng _initialPosition = const LatLng(45.521563, -122.677433);
  LatLng? _selectedPosition;
  final Set<Marker> _markers = {};
  String _selectedLocationName = '';
  double lat = 0;
  double long = 0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newLatLng(_initialPosition),
        );
      }
    });
  }

  Future<void> _onTap(LatLng tappedPoint) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        tappedPoint.latitude, tappedPoint.longitude);

    String placeName = placemarks.isNotEmpty
        ? '${placemarks.first.locality}'
        : 'No address found';

    setState(() {
      _selectedPosition = tappedPoint;
      _selectedLocationName = placeName;
      lat = tappedPoint.latitude;
      long = tappedPoint.longitude;
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          infoWindow: InfoWindow(
            title: 'Tanlangan manzil',
            snippet: placeName,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedLocationName),
      ),
      body: Column(
        children: [
          if (_selectedLocationName.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Manzil: $_selectedLocationName',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 15.0,
              ),
              markers: _markers,
              myLocationEnabled: true,
              onTap: _onTap,
            ),
          ),
          ButtonWidget(height: 48, onTap: (){
              RxBus.post(_selectedLocationName,tag: "address");
              RxBus.post(lat.toString(),tag: "latitude");
              RxBus.post(long.toString(),tag: "longitude");
              Navigator.pop(context);
          }, text: "Saqlash", color: AppColors.blue, textColor: Colors.white),
          SizedBox(height: 32.h,)
        ],
      ),
    );
  }
}
