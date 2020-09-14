import 'package:http/http.dart' as http;
import 'package:test_covid/services/graph.dart';
import 'package:test_covid/services/hospitals.dart';
import 'package:test_covid/services/medical.dart';
import 'Contact.dart';
import 'notification.dart';
import 'hospitals.dart';
import 'graph.dart';
import 'dart:convert';


class service {

  static const String url = 'https://api.rootnet.in/covid19-in/contacts';

  static Future<Contact> getContacts() async {
    final response = await http.get(url);

    if (200 == response.statusCode) {
      return contactFromJson(response.body);
    }
  }

  static const String url_notify = 'https://api.rootnet.in/covid19-in/notifications';

  static Future<NotificationService> getnotifications() async {
    final response = await http.get(url_notify);

    if (200 == response.statusCode) {
      return notificationServiceFromJson(response.body);
    }
  }


    static const String url_hospital = 'https://api.rootnet.in/covid19-in/hospitals/beds';

    static Future<Hospital> gethospitals() async {
      final response = await http.get(url_hospital);

      if (200 == response.statusCode) {
        return hospitalFromJson(response.body);
      }
    }

    static const String url_medical = 'https://api.rootnet.in/covid19-in/hospitals/medical-colleges';

    static Future<Medical> getmedicals() async {
      final response = await http.get(url_medical);

      if (200 == response.statusCode) {
        return medicalFromJson(response.body);
      }
    }

  static const String url_graph= 'https://api-0212.herokuapp.com/api';

  static Future<Graph> getgraphs() async {
    final response = await http.get(url_graph);

    if (200 == response.statusCode) {
      return graphFromJson(response.body);

    }
  }



}