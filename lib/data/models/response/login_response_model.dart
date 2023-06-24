// To parse this JSON data, do
//
//     final financeResponseModel = financeResponseModelFromMap(jsonString);

import 'dart:convert';

class FinanceResponseModel {
    String status;
    Meta meta;
    Data data;

    FinanceResponseModel({
        required this.status,
        required this.meta,
        required this.data,
    });

    factory FinanceResponseModel.fromJson(String str) => FinanceResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FinanceResponseModel.fromMap(Map<String, dynamic> json) => FinanceResponseModel(
        status: json["status"],
        meta: Meta.fromMap(json["meta"]),
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "meta": meta.toMap(),
        "data": data.toMap(),
    };
}

class Data {
    int id;
    String name;
    String email;

    Data({
        required this.id,
        required this.name,
        required this.email,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
    };
}

class Meta {
    String token;

    Meta({
        required this.token,
    });

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "token": token,
    };
}
