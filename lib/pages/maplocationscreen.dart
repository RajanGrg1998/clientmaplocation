import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_location_app/blocs/application_blocs.dart';
import 'package:map_location_app/utils/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:map_location_app/utils/textbox.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({Key? key}) : super(key: key);

  @override
  _MapLocationScreenState createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  GoogleMapController? mapController;

  Set<Marker> markers = {};

  @override
  void dispose() {
    mapController!.dispose();
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
    final applicationBloc = Provider.of<ApplicationBloc>(context);

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
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading'),
                ],
              ),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: _kGooglePlex,
                    myLocationEnabled: false,
                    compassEnabled: false,
                    tiltGesturesEnabled: false,
                    mapType: MapType.normal,
                    markers: markers,
                    onMapCreated: (GoogleMapController contoller) {
                      mapController = contoller;
                      addMarkerOnMap(applicationBloc);
                    },
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 25,
                  right: 25,
                  child: PrimaryButton(
                    title: 'Locate Me',
                    onPressed: () {
                      var cameraPosition = new CameraPosition(
                        target: LatLng(
                            applicationBloc.currentLocation!.latitude,
                            applicationBloc.currentLocation!.longitude),
                        zoom: CAMERA_ZOOM,
                        bearing: CAMERA_BEARING,
                        tilt: CAMERA_TILT,
                      );
                      mapController!.animateCamera(
                          CameraUpdate.newCameraPosition(cameraPosition));
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void addMarkerOnMap(ApplicationBloc applicationBloc) {
    return setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(
            applicationBloc.currentLocation!.latitude,
            applicationBloc.currentLocation!.longitude,
          ),
          infoWindow: InfoWindow(title: 'User Location'),
        ),
      );
    });
  }
}
