// To parse this JSON data, do
//
//     final historyResponseModel = historyResponseModelFromMap(jsonString);

import 'dart:convert';

class HistoryResponseModel {
  String? title;
  Attendance? attendance;
  List<History>? histories;
  List<DateTime>? priodDate;
  String? tableHistory;

  HistoryResponseModel({
    this.title,
    this.attendance,
    this.histories,
    this.priodDate,
    this.tableHistory,
  });

  factory HistoryResponseModel.fromJson(String str) =>
      HistoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryResponseModel.fromMap(Map<String, dynamic> json) =>
      HistoryResponseModel(
        title: json["title"],
        attendance: json["attendance"] == null
            ? null
            : Attendance.fromMap(json["attendance"]),
        histories: json["histories"] == null
            ? []
            : List<History>.from(
                json["histories"]!.map((x) => History.fromMap(x))),
        priodDate: json["priodDate"] == null
            ? []
            : List<DateTime>.from(
                json["priodDate"]!.map((x) => DateTime.parse(x))),
        tableHistory: json["tableHistory"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "attendance": attendance?.toMap(),
        "histories": histories == null
            ? []
            : List<dynamic>.from(histories!.map((x) => x.toMap())),
        "priodDate": priodDate == null
            ? []
            : List<dynamic>.from(priodDate!.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "tableHistory": tableHistory,
      };
}

class Attendance {
  int? id;
  String? title;
  String? description;
  String? startTime;
  String? batasStartTime;
  String? endTime;
  String? batasEndTime;
  dynamic code;
  DateTime? createdAt;
  DateTime? updatedAt;
  Data? data;

  Attendance({
    this.id,
    this.title,
    this.description,
    this.startTime,
    this.batasStartTime,
    this.endTime,
    this.batasEndTime,
    this.code,
    this.createdAt,
    this.updatedAt,
    this.data,
  });

  factory Attendance.fromJson(String str) =>
      Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        startTime: json["start_time"],
        batasStartTime: json["batas_start_time"],
        endTime: json["end_time"],
        batasEndTime: json["batas_end_time"],
        code: json["code"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "start_time": startTime,
        "batas_start_time": batasStartTime,
        "end_time": endTime,
        "batas_end_time": batasEndTime,
        "code": code,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "data": data?.toMap(),
      };
}

class Data {
  String? startTime;
  String? batasStartTime;
  String? endTime;
  String? batasEndTime;
  String? now;
  bool? isStart;
  bool? isEnd;
  bool? isUsingQrcode;
  bool? isHolidayToday;

  Data({
    this.startTime,
    this.batasStartTime,
    this.endTime,
    this.batasEndTime,
    this.now,
    this.isStart,
    this.isEnd,
    this.isUsingQrcode,
    this.isHolidayToday,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        startTime: json["start_time"],
        batasStartTime: json["batas_start_time"],
        endTime: json["end_time"],
        batasEndTime: json["batas_end_time"],
        now: json["now"],
        isStart: json["is_start"],
        isEnd: json["is_end"],
        isUsingQrcode: json["is_using_qrcode"],
        isHolidayToday: json["is_holiday_today"],
      );

  Map<String, dynamic> toMap() => {
        "start_time": startTime,
        "batas_start_time": batasStartTime,
        "end_time": endTime,
        "batas_end_time": batasEndTime,
        "now": now,
        "is_start": isStart,
        "is_end": isEnd,
        "is_using_qrcode": isUsingQrcode,
        "is_holiday_today": isHolidayToday,
      };
}

class History {
  int? id;
  int? userId;
  int? attendanceId;
  DateTime? presenceDate;
  String? presenceEnterTime;
  dynamic presenceOutTime;
  int? isPermission;
  double? latitude;
  double? longitude;
  dynamic location;
  DateTime? createdAt;
  DateTime? updatedAt;

  History({
    this.id,
    this.userId,
    this.attendanceId,
    this.presenceDate,
    this.presenceEnterTime,
    this.presenceOutTime,
    this.isPermission,
    this.latitude,
    this.longitude,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
        id: json["id"],
        userId: json["user_id"],
        attendanceId: json["attendance_id"],
        presenceDate: json["presence_date"] == null
            ? null
            : DateTime.parse(json["presence_date"]),
        presenceEnterTime: json["presence_enter_time"],
        presenceOutTime: json["presence_out_time"],
        isPermission: json["is_permission"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        location: json["location"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "attendance_id": attendanceId,
        "presence_date":
            "${presenceDate!.year.toString().padLeft(4, '0')}-${presenceDate!.month.toString().padLeft(2, '0')}-${presenceDate!.day.toString().padLeft(2, '0')}",
        "presence_enter_time": presenceEnterTime,
        "presence_out_time": presenceOutTime,
        "is_permission": isPermission,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
