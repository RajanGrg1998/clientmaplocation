import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_location_app/utils/primary_button.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({Key? key}) : super(key: key);

  @override
  _MapLocationScreenState createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  // Completer<GoogleMapController> mapController = Completer();
  late GoogleMapController mapController;
  late Position currentPostion;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostion = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Set<Marker> markers = Set<Marker>();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

//initial location
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: CAMERA_ZOOM,
    bearing: CAMERA_BEARING,
    tilt: CAMERA_TILT,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      appBar: AppBar(
        title: TextBox(),
        leadingWidth: 38,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              mapType: MapType.normal,
              markers: Set.from(markers),
              onMapCreated: (GoogleMapController contoller) {
                mapController = contoller;
                // showPinsOnMap();
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 25,
            right: 25,
            child: PrimaryButton(
              title: 'Locate Me',
              onPressed: locatePosition,
            ),
          ),
        ],
      ),
    );
  }

  // void showPinsOnMap() {
  //   setState(() {
  //     markers.add(
  //       Marker(
  //         markerId: MarkerId('id-1'),
  //         draggable: false,
  //         position: LatLng(currentPostion.latitude, currentPostion.longitude),
  //       ),
  //     );
  //   });
  // }
}

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          border: InputBorder.none,
          hintText: 'Search',
        ),
      ),
    );
  }
}
