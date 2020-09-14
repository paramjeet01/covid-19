import 'dart:convert';

Graph graphFromJson(String str) => Graph.fromJson(json.decode(str));

String graphToJson(Graph data) => json.encode(data.toJson());

class Graph {
  Graph({
    this.data,
  });

  List<Datum> data;

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.patientId,
    this.reportedOn,
    this.ageEstimate,
    this.gender,
    this.state,
    this.status,
  });

  int patientId ;
  String reportedOn;
  String ageEstimate;
  String gender;
  String state;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    patientId: json["patientId"],
    reportedOn: json["reportedOn"] ,
    ageEstimate: json["ageEstimate"],
    gender: json["gender"],
    state: json["state"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "patientId": patientId,
    "reportedOn": reportedOn,
    "ageEstimate": ageEstimate,
    "gender": gender,
    "state": state,
    "status": status,
  };
}
