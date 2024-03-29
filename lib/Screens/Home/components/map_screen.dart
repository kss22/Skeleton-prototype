// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// //
// // class MapScreen extends StatefulWidget {
// //   const MapScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }
// //
// // class _MapScreenState extends State<MapScreen> {
// //   static const _initialCameraPosition = CameraPosition(
// //     target: LatLng(38, -100),
// //     zoom: 11.5,
// //   );
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: GoogleMap(
// //         myLocationButtonEnabled: false,
// //         zoomControlsEnabled: false,
// //         initialCameraPosition: _initialCameraPosition,
// //       ),
// //     );
// //   }
// // }
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: false,
          title: FlatButton(
            onPressed: (){},
            child: Container(
              width: 300.0,
              height: 50.0,
              alignment: Alignment.center,
              child: Text(
                "Pharmacies Map",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
        ),
        body: Image.asset(
            'assets/icons/map.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
        )
    );

  }
}
//
//
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapPage extends StatefulWidget {
//   const MapPage({Key? key}) : super(key: key);
//
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   GoogleMapController _controller;
//
//   final LatLng _center = const LatLng(37.7749, -122.4194); // San Francisco
//
//   void _onMapCreated(GoogleMapController controller) {
//     _controller = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Map"),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 11.0,
//         ),
//       ),
//     );
//   }
// }