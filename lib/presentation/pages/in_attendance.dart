import 'dart:convert';

import 'package:attendance_mobile_app/data/models/request/attendance/attendance_in_model.dart';
import 'package:attendance_mobile_app/presentation/utils/table_response_attendance/table_att.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../data/local_resource/auth_local_storage.dart';
import '../../data/models/response/auth/profile_response_model.dart';
import '../../data/repository/location_repository.dart';
import '../config/button_box_decoration.dart';
import '../config/text_style.dart';
import '../utils/table_response_attendance/table_data_absen.dart';

class AttendanceInPage extends StatefulWidget {
  const AttendanceInPage({super.key});

  @override
  State<AttendanceInPage> createState() => _AttendanceInPageState();
}

class _AttendanceInPageState extends State<AttendanceInPage> {
  late final Future<Position> _getLocation =
      LocationRepository().getLocationPosition();
  late Future<Position> getCurrLoc = getLocationPosition();

  Future<Position> getAddressLoc() async {
    Position position = await getCurrLoc;
    setState(() {
      getAddressFromLongLat(position);
    });
    return position;
  }

  Future<ProfileResponseModel> getUserProfile() async {
    final token = await AuthLocalStorage().getToken();
    var header = {'Authorization': 'Bearer $token'};
    final response = await http.get(
        Uri.parse('http://absensi.zcbyr.tech/api/user-detail'),
        headers: header);
    final result = ProfileResponseModel.fromJson(response.body);
    setState(() {
      name = result.name;
      position = result.position;
    });
    return result;
  }

  double lat = 0;
  double long = 0;
  String address = '';
  String dataLocation = '';
  String timePresence = '';
  String name = '';
  String position = '';

  @override
  void initState() {
    getAddressLoc();
    getUserProfile();
    _getLocation;
    getCurrLoc;
    lat;
    long;
    getLocationPosition();
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
                            'Absensi Kehadiran',
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
                future: _getLocation,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error : ${snapshot.error}"),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else if (snapshot.data == null) {
                    return Container();
                  }
                  final data = snapshot.data!;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 428,
                          child: Builder(
                            builder: (context) {
                              List<Marker> allMarkers = [
                                Marker(
                                  point: LatLng(data.latitude, data.longitude),
                                  builder: (context) => const Icon(
                                    Icons.pin_drop,
                                    color: Colors.red,
                                    size: 24,
                                  ),
                                ),
                              ];
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: FlutterMap(
                                  options: MapOptions(
                                    center:
                                        LatLng(data.latitude, data.longitude),
                                    zoom: 16,
                                    interactiveFlags: InteractiveFlag.all -
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                              color: const Color(0xff5D5FEF)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                const TableResponse(),
                                DataAttendance(title: 'Nama : ', value: name),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                DataAttendance(
                                    title: 'Position : ', value: position),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                DataAttendance(
                                    title: 'Latitude : ',
                                    value: data.latitude.toString()),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                DataAttendance(
                                    title: 'Longitude : ',
                                    value: data.longitude.toString()),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                DataAttendance(
                                    title: 'Address : ', value: dataLocation),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                InkWell(
                                  onTap: () async {
                                    Position position = await getCurrLoc;
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
                                    margin: const EdgeInsets.only(bottom: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: 77,
                                    decoration:
                                        BoxDecorationCustom().buttonBlue,
                                    child: Center(
                                      child: Text(
                                        'Hadir',
                                        style: mainTitle.copyWith(
                                            color: Colors.white, fontSize: 26),
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
                  );
                },
              ),
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
          'location': address
        },
      );
      final data = jsonEncode(response.body);
      AttResponseModel result = AttResponseModel.fromJson(jsonDecode(data));
      if (result.success!) {
        showTopSnackBar(
          // ignore: use_build_context_synchronously
          Overlay.of(context),
          CustomSnackBar.success(
            message: result.message!,
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } else {
        showTopSnackBar(
          // ignore: use_build_context_synchronously
          Overlay.of(context),
          CustomSnackBar.error(
            message: '${result.message}',
          ),
        );
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
      return response;
    } catch (e) {
      showTopSnackBar(
          // ignore: use_build_context_synchronously
          Overlay.of(context),
          CustomSnackBar.error(
            message: e.toString(),
          ),
        );
      throw Exception('Gagal');
    }
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      address =
          '${place.thoroughfare} ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea} ${place.country},';
      dataLocation =
          ' ${place.thoroughfare} ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.country},';
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

// Builder(
// builder: (context) {
// List<Marker> allMarkers = [
// Marker(
// point: LatLng(
// -6.1754234,
// 106.827224,
// ),
// builder: (context) => const Icon(
// Icons.pin_drop,
// color: Colors.red,
// size: 24,
// ),
// ),
// ];
// return SizedBox(
// height: MediaQuery.of(context).size.height * 0.4,
// child: FlutterMap(
// options: MapOptions(
// center: LatLng(
// -6.1754234,
// 106.827224,
// ),
// zoom: 16,
// interactiveFlags:
// InteractiveFlag.all - InteractiveFlag.rotate,
// ),
// children: [
// TileLayer(
// urlTemplate:
// 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
// userAgentPackageName:
// 'dev.fleaflet.flutter_map.example',
// ),
// MarkerLayer(
// markers: allMarkers,
// ),
// ],
// ),
// );
// },
// ),
