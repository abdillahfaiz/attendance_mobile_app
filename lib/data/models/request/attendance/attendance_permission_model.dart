import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PermissionModel {
  final String title;
  final String desc;
  PermissionModel({
    required this.title,
    required this.desc,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
    };
  }

  factory PermissionModel.fromMap(Map<String, dynamic> map) {
    return PermissionModel(
      title: map['title'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PermissionModel.fromJson(String source) =>
      PermissionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
