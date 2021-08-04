import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_location_app/blocs/application_blocs.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Location',
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (searchTerm) =>
                        applicationBloc.serachPlaces(searchTerm),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 300,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(41.8781, -87.6298),
                          // target: LatLng(applicationBloc.currentLocation!.latitude,
                          //     applicationBloc.currentLocation!.longitude),
                          zoom: 14,
                        ),
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        onMapCreated: (controller) {
                          mapController = controller;
                        },
                      ),
                    ),
                    if (applicationBloc.searchResults.length != 0)
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            backgroundBlendMode: BlendMode.darken),
                      ),
                    Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: applicationBloc.searchResults.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              applicationBloc.searchResults[index].description,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    CameraPosition cameraPosition = new CameraPosition(
                        target: LatLng(
                            applicationBloc.currentLocation!.latitude,
                            applicationBloc.currentLocation!.longitude),
                        zoom: 14);
                    mapController!.animateCamera(
                        CameraUpdate.newCameraPosition(cameraPosition));
                  },
                  child: Text('Locate Me'),
                ),
              ],
            ),
    );
  }

  // void locate() async {
  //   final applicationBloc =
  //       Provider.of<ApplicationBloc>(context, listen: false);
  //   CameraPosition cameraPosition = new CameraPosition(
  //       target: LatLng(applicationBloc.currentLocation!.latitude,
  //           applicationBloc.currentLocation!.longitude),
  //       zoom: 14);
  //   mapController!
  //       .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  // }
}
