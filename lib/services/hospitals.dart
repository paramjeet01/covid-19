// To parse this JSON data, do
//
//     final hospital = hospitalFromJson(jsonString);

import 'dart:convert';

import 'package:test_covid/services/Contact.dart';

Hospital hospitalFromJson(String str) => Hospital.fromJson(json.decode(str));

String hospitalToJson(Hospital data) => json.encode(data.toJson());

class Hospital {
  Hospital({
    this.success,
    this.data,
    this.lastRefreshed,
    this.lastOriginUpdate,
  });

  bool success;
  Data data;
  DateTime lastRefreshed;
  DateTime lastOriginUpdate;

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    lastRefreshed: DateTime.parse(json["lastRefreshed"]),
    lastOriginUpdate: DateTime.parse(json["lastOriginUpdate"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "lastRefreshed": lastRefreshed.toIso8601String(),
    "lastOriginUpdate": lastOriginUpdate.toIso8601String(),
  };
}

class Data {
  Data({
    this.summary,
    this.sources,
    this.regional,
  });

  Summary summary;
  List<Source> sources;
  List<Regional> regional;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    summary: Summary.fromJson(json["summary"]),
    sources: List<Source>.from(json["sources"].map((x) => Source.fromJson(x))),
    regional: List<Regional>.from(json["regional"].map((x) => Regional.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "summary": summary.toJson(),
    "sources": List<dynamic>.from(sources.map((x) => x.toJson())),
    "regional": List<dynamic>.from(regional.map((x) => x.toJson())),
  };
}

class Summary {
  Summary({
    this.ruralHospitals,
    this.ruralBeds,
    this.urbanHospitals,
    this.urbanBeds,
    this.totalHospitals,
    this.totalBeds,
  });

  int ruralHospitals;
  int ruralBeds;
  int urbanHospitals;
  int urbanBeds;
  int totalHospitals;
  int totalBeds;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    ruralHospitals: json["ruralHospitals"],
    ruralBeds: json["ruralBeds"],
    urbanHospitals: json["urbanHospitals"],
    urbanBeds: json["urbanBeds"],
    totalHospitals: json["totalHospitals"],
    totalBeds: json["totalBeds"],
  );

  Map<String, dynamic> toJson() => {
    "ruralHospitals": ruralHospitals,
    "ruralBeds": ruralBeds,
    "urbanHospitals": urbanHospitals,
    "urbanBeds": urbanBeds,
    "totalHospitals": totalHospitals,
    "totalBeds": totalBeds,
  };
}

class Source {
  Source({
    this.url,
    this.lastUpdated,
  });

  String url;
  DateTime lastUpdated;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    url: json["url"],
    lastUpdated: DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "lastUpdated": lastUpdated.toIso8601String(),
  };
}

class Regional {
  Regional({
    this.state,
    this.ruralHospitals,
    this.ruralBeds,
    this.urbanHospitals,
    this.urbanBeds,
    this.totalHospitals,
    this.totalBeds,
    this.asOn,
  });

  String state;
  int ruralHospitals;
  int ruralBeds;
  int urbanHospitals;
  int urbanBeds;
  int totalHospitals;
  int totalBeds;
  String asOn;

  factory Regional.fromJson(Map<String, dynamic> json) => Regional(
    state: json["state"],
    ruralHospitals: json["ruralHospitals"],
    ruralBeds: json["ruralBeds"],
    urbanHospitals: json["urbanHospitals"],
    urbanBeds: json["urbanBeds"],
    totalHospitals: json["totalHospitals"],
    totalBeds: json["totalBeds"],
    asOn: json["asOn"],
  );

  Map<String, dynamic> toJson() => {
    "state" :state,
    "ruralHospitals": ruralHospitals,
    "ruralBeds": ruralBeds,
    "urbanHospitals": urbanHospitals,
    "urbanBeds": urbanBeds,
    "totalHospitals": totalHospitals,
    "totalBeds": totalBeds,
    "asOn": asOn,
  };
}
