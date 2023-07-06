import 'package:attendance_mobile_app/presentation/utils/table_response_attendance/table_att.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

import '../../data/local_resource/auth_local_storage.dart';
import '../../data/repository/location_repository.dart';
import '../config/button_box_decoration.dart';
import '../config/text_style.dart';

class AttendanceOutPage extends StatefulWidget {
  const AttendanceOutPage({super.key});

  @override
  State<AttendanceOutPage> createState() => _AttendanceInPageState();
}

class _AttendanceInPageState extends State<AttendanceOutPage> {
  late Future _getLocation = LocationRepository().getLocationPosition();
  double lat = 0;
  double long = 0;
  String address = '';
  String timePresence = '';

  Future getCurrLoc() async {
    Position position = await _getLocation;
    return position;
  }

  @override
  void initState() {
    _getLocation;
    getCurrLoc();
    lat;
    long;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                const Icon(Icons.arrow_back_ios_new_rounded)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.04,
                          child: const Text(
                            'Absensi Pulang',
                            style: mainTitle,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile-page');
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/icons/avatar_icon.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              FutureBuilder(
                  future: getLocationPosition(),
                  builder: (context, snapshot) {
                    final Position data = snapshot.data!;
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Tampilkan indikator loading atau tampilan kosong jika masih dalam proses memuat data
                      return Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Image.asset(
                            'assets/icons/loading-bar.gif',
                            width: 200,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Error : ${snapshot.error}"),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                    List<Marker> allMarkers = [
                      Marker(
                        point: LatLng(
                          data.latitude,
                          data.longitude,
                        ),
                        builder: (context) => const Icon(
                          Icons.pin_drop,
                          color: Colors.red,
                          size: 24,
                        ),
                      ),
                    ];
                    return snapshot.data != null
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 428,
                                  child: Builder(
                                    builder: (context) {
                                      // List<Marker> allMarkers = [
                                      //   Marker(
                                      //     point:  LatLng(
                                      //       data.latitude,
                                      //         data.longitude,
                                      //     ),
                                      //     builder: (context) => const Icon(
                                      //       Icons.pin_drop,
                                      //       color: Colors.red,
                                      //       size: 24,
                                      //     ),
                                      //   ),
                                      // ];
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                        child: FlutterMap(
                                          options: MapOptions(
                                            center: LatLng(
                                                data.latitude, data.longitude),
                                            zoom: 16,
                                            interactiveFlags:
                                                InteractiveFlag.all -
                                                    InteractiveFlag.rotate,
                                          ),
                                          children: [
                                            TileLayer(
                                              urlTemplate:
                                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                              userAgentPackageName:
                                                  'dev.fleaflet.flutter_map.example',
                                            ),
                                            MarkerLayer(
                                              markers: allMarkers,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height / 2.2,
                                  width: MediaQuery.of(context).size.width,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 33, right: 33, top: 20),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 25,
                                          offset: Offset(3, -5),
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: SizedBox(
                                              width: 113,
                                              child: Divider(
                                                thickness: 5,
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 19.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Detail',
                                              style: mainTitle,
                                            ),
                                            StreamBuilder(
                                              stream: Stream.periodic(
                                                  const Duration(seconds: 1)),
                                              builder: (context, snapshot) {
                                                return Text(
                                                  DateFormat("HH:mm:ss")
                                                      .format(DateTime.now()),
                                                  style: mainTitle.copyWith(
                                                      fontSize: 20,
                                                      color: const Color(
                                                          0xff5D5FEF)),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        TableResponse(
                                            name: 'Name',
                                            role: 'Role',
                                            timePresence: 'Time',
                                            lat: lat.toString(),
                                            long: long.toString(),
                                            address: address),
                                        const SizedBox(
                                          height: 24.0,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            Position position =
                                                await _getLocation;
                                            String timeAttendance =
                                                DateFormat("HH:mm:ss")
                                                    .format(DateTime.now());
                                            const CircularProgressIndicator();
                                            setState(() {
                                              lat = position.latitude;
                                              long = position.longitude;
                                              timePresence = timeAttendance;
                                              getAddressFromLongLat(position);
                                            });
                                            attendanceIn(lat, long, address);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 77,
                                            decoration: BoxDecorationCustom()
                                                .orangeButton,
                                            child: Center(
                                              child: Text(
                                                'Pulang',
                                                style: mainTitle.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 26),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future attendanceIn(
    double lat,
    double long,
    String address,
  ) async {
    final String token = await AuthLocalStorage().getToken();
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await http.post(
        Uri.parse('http://absensi.zcbyr.tech/api/absensi/1/hadir'),
        headers: headers,
        body: {
          'latitude': lat.toString(),
          'longitude': long.toString(),
          'address': address
        },
      );
    } catch (e) {
      throw Exception('Gagal');
    }
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      address =
          ' ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country},';
    });
  }
}

Future<Position> getLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location Permission is denied');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location Permission is denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permission denied forever, we cannot access');
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
}
