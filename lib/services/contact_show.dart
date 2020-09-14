import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Contact.dart';
import 'service.dart';

class jsonparse extends StatefulWidget {
  @override
  _jsonparseState createState() => _jsonparseState();
}

class _jsonparseState extends State<jsonparse> {

   Future <Contact> futureContact;

  @override
  void initState() {
    super.initState();
    futureContact = service.getContacts();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Contact>(
          future: futureContact,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Statedata(regional:snapshot.data.data.contacts.regional);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Statedata extends StatelessWidget {
  List <Regional> regional;

  Statedata({this.regional});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Hexcolor('#101935'),
        title: Text('Helpline Information'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: regional.length,
        itemBuilder: (context, index){
          return listitem(index);
        },
      ),
    );
  }

    listitem(index)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1 ,horizontal: 4),
        child: Card(
          child: ListTile(
            onTap: (){
              String no = "tel:"+regional[index].number;
              launch(no);
            },
            title: Text(regional[index].loc),
            trailing: Icon(Icons.phone),
            subtitle: Text(regional[index].number),
            ),
          ),
      );
    }

  }
  




