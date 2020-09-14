// To parse this JSON data, do
//
//     final notificationService = notificationServiceFromJson(jsonString);

import 'dart:convert';

NotificationService notificationServiceFromJson(String str) => NotificationService.fromJson(json.decode(str));

String notificationServiceToJson(NotificationService data) => json.encode(data.toJson());

class NotificationService {
  NotificationService({
    this.success,
    this.data,
    this.lastRefreshed,
    this.lastOriginUpdate,
  });

  bool success;
  Data data;
  DateTime lastRefreshed;
  DateTime lastOriginUpdate;

  factory NotificationService.fromJson(Map<String, dynamic> json) => NotificationService(
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
    this.notifications,
  });

  List<Notifications> notifications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    notifications: List<Notifications>.from(json["notifications"].map((x) => Notifications.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notifications {
  Notifications({
    this.title,
    this.link,
  });

  String title;
  String link;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    title: json["title"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
  };
}
